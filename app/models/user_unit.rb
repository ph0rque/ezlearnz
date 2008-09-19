class UserUnit < ActiveRecord::Base

  has_many   :sub_user_units, :class_name => 'user_unit', :foreign_key => 'parent_id'
  belongs_to :user_parent,    :class_name => 'user_unit', :foreign_key => 'parent_id'
  belongs_to :user
  belongs_to :unit

  has_many :user_parts, :dependent => :destroy

end
