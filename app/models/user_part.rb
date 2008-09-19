class UserPart < ActiveRecord::Base
  belongs_to :part
  belongs_to :user_unit
end
