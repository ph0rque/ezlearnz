class UserQAndA < ActiveRecord::Base
  belongs_to :q_and_a
  belongs_to :user_part
end
