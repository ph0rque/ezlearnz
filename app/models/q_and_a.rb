class QAndA < ActiveRecord::Base
  belongs_to :part
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'  
  acts_as_list :scope => :part
end
