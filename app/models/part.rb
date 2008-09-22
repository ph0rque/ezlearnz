class Part < ActiveRecord::Base
  belongs_to :unit, :polymorphic => true
  has_many :user_parts
  has_many :q_and_as
  validates_presence_of :title, :unit_id
  
  acts_as_list :scope => :unit # This will probably need to be replaced.

  after_create :populate
  def populate
    case self.part_type
      when "Quiz", "Exam", "Final Exam", "Problem Set"
        5.times { |i| QAndA.create(:part_id => self.id, :question => "Question #{i+1}",
                                   :answer => "Answer #{i+1}") }
      when "Reading Assignment", "Writing Assignment", "Discussion", "Presentation",
           "Lecture", "Reference Material"
        #Do nothing for now
    end
  end
end
