# == Schema Information
# Schema version: 11
#
# Table name: user_q_and_as
#
#  id                  :integer(11)     not null, primary key
#  user_q_and_a_set_id :integer(11)     
#  q_and_a_id          :integer(11)     
#  instructor          :boolean(1)      
#  grade               :integer(10)     
#  student_answer      :text            
#  created_at          :datetime        
#  updated_at          :datetime        
#

class UserQAndA < ActiveRecord::Base

  belongs_to :q_and_a
  belongs_to :user_part

end
