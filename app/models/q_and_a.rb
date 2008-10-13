class QAndA < ActiveRecord::Base
  belongs_to :part

  acts_as_list :scope => :part
  
  def initialize(current_user, *params)
    super(*params)
    @current_user = current_user
  end
    
  after_create :assign_author
  
  def assign_author
    if (@current_user)
      UserQAndA.create(:user_part_id => self.part.user_part.id, :q_and_a_id =>self.id,
                      :user_id => @current_user.id, :instructor => 'true')
    end
  end
end
