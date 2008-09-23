class QAndA < ActiveRecord::Base
  belongs_to :part

  acts_as_list :scope => :part 
end
