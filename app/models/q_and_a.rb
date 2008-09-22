class QAndA < ActiveRecord::Base
  belongs_to :q_and_a_set

  acts_as_list :scope => :part 
end
