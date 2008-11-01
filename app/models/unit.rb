class Unit < ActiveRecord::Base
  has_many   :sub_units, :class_name => 'Unit', :foreign_key => 'parent_id', :order => 'position',
             :dependent => :destroy # take this out before opening beta
  belongs_to :parent,    :class_name => 'Unit', :foreign_key => 'parent_id'

  has_many   :parts, :order => 'position', :dependent => :destroy
  has_many   :user_units, :dependent => :destroy
  has_many   :users, :through => :user_units

  acts_as_list :scope => :parent unless self.parent.nil? # This will probably need to be replaced.

  def initialize(current_user, *params)
    super(*params)
    @current_user = current_user
  end
  
  def create(*args)
    self.new.update_attributes(*args).save!
  end
  
  def self.unit_types
    ["Subject", "Fragment", "Chapter", "Lesson", "Lab"]
  end

  def self.part_types
    ["Reading Assignment", "Writing Assignment", "Discussion", "Presentation",
     "Paper", "Problem Set", "Final Exam", "Exam", "Quiz", "Lecture", 
     "Reference Material"]
  end

  def allowed_unit_types
    case self.unit_type
      when "Subject"       then unit_types - ["Subject"]
      when "Fragment"      then unit_types - ["Subject", "Fragment"]
      when "Chapter"       then ["Lesson", "Lab"]
      when "Lesson", "Lab" then [] #no unit types allowed
    end
  end

  def allowed_part_types
    case self.unit_type
      when "Subject"  then ["Final Exam"]
      when "Fragment" then part_types
      when "Chapter"  then part_types - ["Final Exam", "Quiz"]
      when "Lesson"   then part_types - ["Final Exam", "Exam"]
      when "Lab"      then part_types - ["Final Exam", "Exam", "Quiz", "Presentation", "Problem Set"]
    end
  end

  after_create :populate, :assign_author
  
  def populate
    case self.unit_type
      when "Subject"
        5.times { |i| Unit.new.update_attributes(:unit_type =>"Chapter", :parent_id =>self.id, :title => "Chapter #{i+1}").save! }
        Part.new.update_attributes(:part_type =>"Final Exam", :unit_id =>self.id, :title => "#{self.title} Final Exam").save!
      when "Chapter"
        5.times { |i| Unit.create(:unit_type =>"Lesson", :parent_id => self.id, :title => "Lesson #{i+1}") }
        Unit.create(:unit_type =>"Lab", :parent_id => self.id, :title => "#{self.title} Lab")
        Part.create(:part_type =>"Exam", :unit_id => self.id, :title => "#{self.title} Chapter Exam")
      when "Lesson"
        4.times { |i| Part.create(:part_type =>"Lecture", :unit_id => self.id, :title => "Part #{i+1}") }
        Part.create(:part_type =>"Problem Set", :unit_id => self.id, :title => "#{self.title} Problem Set")
      when "Lab"
        3.times { |i| Part.create(:part_type =>"Lecture", :unit_id => self.id, :title => "Part #{i+1}") }
        Part.create(:part_type =>"Writing Assignment", :unit_id => self.id,
                     :title => "Assignment: #{self.title} Report")
    end
  end

  def assign_author
    if (@current_user); UserUnit.create(:unit_id =>self.id, :user_id => @current_user.id, :instructor => 'true'); end
  end
end
