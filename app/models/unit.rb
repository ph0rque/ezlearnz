class Unit < ActiveRecord::Base
  has_many   :sub_units, :class_name => 'Unit', :foreign_key => 'parent_id', :order => 'position',
             :dependent => :destroy # take this out before opening beta
  belongs_to :parent,    :class_name => 'Unit', :foreign_key => 'parent_id'

  has_many   :parts, :order => 'position', :dependent => :destroy
  has_many   :user_units, :dependent => :destroy
  has_many   :users, :through => :user_units

  acts_as_list :scope => :parent unless self.parent.nil? # This will probably need to be replaced.

  after_create :populate
  def populate
    case self.unit_type
      when "Subject"
        5.times { |i| Unit.create(:unit_type =>"Chapter", :parent_id =>self.id, :title => "Chapter #{i+1}") }
        Part.create(:part_type =>"Final Exam", :unit_id =>self.id, :title => "#{self.title} Final Exam")
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
end

  # after_create :determine_author
  ## Create the join table for user and unit, unless it already exists.
  # def determine_author
  #   if self.users.empty? 
  #     if self.parent? user_unit.create(:instructor =>'true') :
  #                     user_unit.create(:user_id => current_user.id, :instructor =>'true')
  #   end
  # end
