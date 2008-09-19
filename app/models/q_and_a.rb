# == Schema Information
# Schema version: 11
#
# Table name: q_and_as
#
#  id             :integer(11)     not null, primary key
#  q_and_a_set_id :integer(11)     
#  position       :integer(11)     
#  score          :integer(11)     
#  question       :text            
#  answer         :text            
#  explanation    :text            
#  created_at     :datetime        
#  updated_at     :datetime        
#

class QAndA < ActiveRecord::Base

  belongs_to :q_and_a_set

  acts_as_list :scope => :q_and_a_set 
  
end
