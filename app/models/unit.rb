class Unit < ActiveRecord::Base
  has_many   :sub_units, :class_name => 'Unit', :foreign_key => 'parent_id', :order => 'position'
             #TODO: give the user an option to delete sub_units when deleting a unit
  belongs_to :parent,    :class_name => 'Unit', :foreign_key => 'parent_id', :polymorphic => true

  has_many   :parts, :order => 'position', :dependent => :destroy
  has_many   :user_units, :dependent => :destroy
  has_many   :users, :through => :user_units

  acts_as_list :scope => :parent unless self.parent.nil?
  # vestigial methods at the bottom of this file
end

class Subject < Unit
  after_create :populate
  def populate
    5.times { |i| Chapter.create(:parent_id =>self.id, :title => "Chapter #{i+1}") }
    FinalExam.create(:unit_id =>self.id, :title => "#{self.title} Final Exam")
  end
end

class Fragment < Unit; end 

class Chapter < Unit
  after_create :populate
  def populate
    5.times { |i| Lesson.create(:parent_id => self.id, :title => "Lesson #{i+1}") }
    Lab.create(:parent_id => self.id, :title => "#{self.title} Lab")
    Exam.create(:unit_id => self.id, :title => "#{self.title} Chapter Exam")
  end
end

class Lesson < Unit
  after_create :populate
  def populate
    4.times { |i| Lecture.create(:unit_id => self.id, :title => "Part #{i+1}") }
    ProblemSet.create(:unit_id => self.id, :title => "#{self.title} Problem Set")
  end
end

class Lab < Unit
  after_create :populate
  def populate
    3.times { |i| Lecture.create(:unit_id => self.id, :title => "Part #{i+1}") }
    WritingAssignment.create(:unit_id => self.id, :title => "Assignment: #{self.title} Report")
  end
end

  # def self.factory(type, params = nil)
  #   type ||= 'Unit'
  #   begin
  #     if (type.constantize.base_class) == Unit
  #       return type.constantize.new(params)
  #     end
  #   rescue
  #     logger.warn("Failed attempting to create a Unit of type: #{type}")
  #   end
  #   return Unit.new(params)
  # end

  # after_create :determine_author
  # Create the join table for user and unit, unless it already exists.
  # def determine_author
  #   if self.users.empty? 
  #     if !self.parent.nil?
  #       user_unit.create(:instructor =>'true') 
  #     else
  #       user_unit.create(:user_id => current_user.id, :instructor =>'true')
  #     end
  #   end
  # end