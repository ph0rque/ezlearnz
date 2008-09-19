class Part < ActiveRecord::Base
  belongs_to :unit, :polymorphic => true
  has_many :user_parts
  validates_presence_of :title, :unit_id
  
  acts_as_list :scope => :unit

end

class Quiz < Part
  has_many :q_and_as
  after_create :populate
  def populate
    5.times { |i| QAndA.create(:question => "Question #{i+1}", :answer => "Answer #{i+1}") }
    Quiz.create(:title => "#{self.title} Quiz")
  end
end

class Exam < Part
  has_many :q_and_as  
  after_create :populate
  def populate
    5.times { |i| QAndA.create(:question => "Question #{i+1}", :answer => "Answer #{i+1}") }
    Quiz.create(:title => "#{self.title} Quiz")
  end
end

class FinalExam < Part
  has_many :q_and_as  
  after_create :populate
  def populate
    5.times { |i| QAndA.create(:question => "Question #{i+1}", :answer => "Answer #{i+1}") }
    Quiz.create(:title => "#{self.title} Quiz")
  end
end

class ProblemSet < Part
  has_many :q_and_as  
  after_create :populate
  def populate
    5.times { |i| QAndA.create(:question => "Question #{i+1}", :answer => "Answer #{i+1}") }
    Quiz.create(:title => "#{self.title} Quiz")
  end
end

class ReadingAssignment < Part; end
class WritingAssignment < Part; end
class Discussion        < Part; end
class Presentation      < Part; end
class Lecture           < Part; end
class ReferenceMaterial < Part; end
