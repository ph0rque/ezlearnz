class Unit < ActiveRecord::Base
  has_many   :sub_units, :class_name => 'Unit', :foreign_key => 'parent_id', :order => 'position',
             :dependent => :destroy # TODO: take this out before opening beta
  belongs_to :parent,    :class_name => 'Unit', :foreign_key => 'parent_id'
  belongs_to :author,    :class_name => 'User', :foreign_key => 'author_id'
  
  has_many   :parts, :order => 'position', :dependent => :destroy
  has_many   :user_units, :dependent => :destroy
  has_many   :users, :through => :user_units


  acts_as_list :scope => :parent unless self.parent.nil? # TODO: this will probably need to be replaced.

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
        5.times { |i| self.sub_units << Unit.create(:author => self.author, :unit_type => "Chapter", :title => "Chapter #{i+1}") }
        self.parts << Part.create(:author => self.author, :part_type =>"Final Exam", :title => "#{self.title} Final Exam")
      when "Chapter"
        5.times { |i| self.sub_units << Unit.create(:author => self.author, :unit_type => "Lesson", :title => "Lesson #{i+1}") }
        self.sub_units << Unit.create(:author => self.author, :unit_type => "Lab", :title => "#{self.title} Lab") 
        self.parts << Part.create(:author => self.author, :part_type =>"Exam", :title => "#{self.title} Exam")
      when "Lesson"
        4.times { |i| self.parts << Part.create(:author => self.author, :part_type => "Lecture", :title => "Part #{i+1}") }
        self.parts << Part.create(:author => self.author, :part_type =>"Final Exam", :title => "#{self.title} Problem Set")
      when "Lab"
        3.times { |i| self.parts << Part.create(:author => self.author, :part_type => "Lecture", :title => "Part #{i+1}") }
        self.parts << Part.create(:author => self.author, :part_type =>"Writing Assignment",
                                  :title => "Assignment: #{self.title} Report")
    end
  end

end
