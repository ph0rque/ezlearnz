class Part < ActiveRecord::Base
  belongs_to :unit
  has_many :user_parts
  has_many :q_and_as, :dependent => :destroy
  validates_presence_of :title, :unit_id
  
  acts_as_list :scope => :unit # This will probably need to be replaced.
  
  def initialize(current_user, *params)
    super(*params)
    @current_user = current_user
  end
  
  after_create :populate, :assign_author
  
  def populate
    case self.part_type
      when "Problem Set", "Quiz", "Exam", "Final Exam"
        5.times { |i| QAndA.create(:part_id  => self.id,
                                   :question => "Question #{i+1}",
                                   :answer   => "Answer #{i+1}") }
      when "Reading Assignment", "Writing Assignment", "Discussion", "Presentation",
           "Lecture", "Reference Material"
        #Do nothing for now
    end
  end

  def assign_author
    if (@current_user)
      UserPart.create(:user_unit_id => self.unit.user_unit.id, :part_id =>self.id,
                      :user_id => @current_user.id, :instructor => 'true')
    end
  end
end