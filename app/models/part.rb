class Part < ActiveRecord::Base
  belongs_to :unit
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
    
  has_many :user_parts
  has_many :q_and_as, :dependent => :destroy
  validates_presence_of :title, :unit_id
  
  acts_as_list :scope => :unit # This will probably need to be replaced.
  
  after_create :populate
  
  def populate
    case self.part_type
      when "Problem Set", "Quiz", "Exam", "Final Exam"
        5.times { |i| self.q_and_as << QAndA.create(:author => self.author, :question => "Question #{i+1}", :answer   => "Answer #{i+1}") }
      when "Reading Assignment", "Writing Assignment", "Discussion", "Presentation",
           "Lecture", "Reference Material"
        #Do nothing for now
    end
  end
end