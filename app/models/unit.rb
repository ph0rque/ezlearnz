class Unit < ActiveRecord::Base
  has_many   :sub_units, :class_name => 'Unit', :foreign_key => 'parent_id', :order => 'position'
  belongs_to :parent,    :class_name => 'Unit', :foreign_key => 'parent_id'

  has_many   :parts, :order => 'position', :dependent => :destroy
  has_many   :user_units, :dependent => :destroy
  has_many   :users, :through => :user_units

  acts_as_list :scope => :parent unless self.parent.nil? # This will probably need to be replaced.

  def self.populate
    case self.type
      when "Subject"
        5.times { |i| units.create(:type =>"Chapter", :parent_id =>self.id, :title => "Chapter #{i+1}") }
        parts.create(:type =>"Final Exam", :unit_id =>self.id, :title => "#{self.title} Final Exam")
      when "Chapter"
        5.times { |i| units.create(:type =>"Lesson", :parent_id => self.id, :title => "Lesson #{i+1}") }
        units.create(:type =>"Lab", :parent_id => self.id, :title => "#{self.title} Lab")
        parts.create(:type =>"Exam", :unit_id => self.id, :title => "#{self.title} Chapter Exam")
      when "Lesson"
        4.times { |i| parts.create(:type =>"Lecture", :unit_id => self.id, :title => "Part #{i+1}") }
        parts.create(:type =>"Problem", :unit_id => self.id, :title => "#{self.title} Problem Set")
      when "Lab"
        3.times { |i| parts.create(:type =>"Lecture", :unit_id => self.id, :title => "Part #{i+1}") }
        parts.create(:type =>"Writing Assignment", :unit_id => self.id, :title => "Assignment: #{self.title} Report")
    end
  end
  # vestigial methods at the bottom of this file
end

  # after_create :determine_author
  ## Create the join table for user and unit, unless it already exists.
  # def determine_author
  #   if self.users.empty? 
  #     if self.parent? user_unit.create(:instructor =>'true') : user_unit.create(:user_id => current_user.id, :instructor =>'true')
  #   end
  # end
