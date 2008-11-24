class Unit < ActiveRecord::Base
  has_many   :sub_units, :class_name => 'Unit', :order => 'position',
             :dependent => :destroy # take this out before opening beta
  belongs_to :parent,    :class_name => 'Unit'
  belongs_to :author,    :class_name => 'User'
  
  has_many   :parts, :order => 'position', :dependent => :destroy
  has_and_belongs_to_many :users # students

  acts_as_list :scope => :parent unless self.parent.nil? # This will probably need to be replaced.

  def unit_types
    ["Subject", "Fragment", "Chapter", "Lesson", "Lab"]
  end

  def part_types
    ["Reading Assignment", "Writing Assignment", "Discussion", "Presentation", "Paper",
     "Problem Set", "Final Exam", "Exam", "Quiz", "Lecture", "Reference Material"]
  end

  def allowed_unit_types
    case self.unit_type
      when "Subject"       : unit_types - ["Subject"]
      when "Fragment"      : unit_types - ["Subject", "Fragment"]
      when "Chapter"       : ["Lesson", "Lab"]
      when "Lesson", "Lab" : [] #no unit types allowed
    end
  end

  def allowed_part_types
    case self.unit_type
      when "Subject"  : ["Final Exam"]
      when "Fragment" :
      when "Chapter"  : part_types - ["Final Exam", "Quiz"]
      when "Lesson"   : part_types - ["Final Exam", "Exam"]
      when "Lab"      : part_types - ["Final Exam", "Exam", "Quiz", "Presentation", "Problem Set"]
    end
  end

  after_create :populate
  
  def populate
    case self.unit_type
      when "Subject"
        5.times { |i| self.sub_units << units.create(:author => self.author, :unit_type => "Chapter", :title => "Chapter #{i+1}") }
        self.parts << Part.new(:part_type =>"Final Exam", :title => "#{self.title} Final Exam")
      when "Chapter"
      #  5.times { |i| Unit.create(:unit_type => "Lesson", :parent_id => self.id, :title => "Lesson #{i+1}") }
      #  Unit.create(:unit_type => "Lab", :parent_id => self.id, :title => "#{self.title} Lab")
      #  Part.create(:part_type => "Exam", :unit_id => self.id, :title => "#{self.title} Chapter Exam")
      when "Lesson"
        4.times { |i| Part.create(:part_type =>"Lecture", :unit_id => self.id, :title => "Part #{i+1}") }
        Part.create(:part_type => "Problem Set", :unit_id => self.id, :title => "#{self.title} Problem Set")
      when "Lab"
        3.times { |i| Part.create(:part_type => "Lecture", :unit_id => self.id, :title => "Part #{i+1}") }
        Part.create(:part_type => "Writing Assignment", :unit_id => self.id,
                    :title => "Assignment: #{self.title} Report")
    end
  end

end
