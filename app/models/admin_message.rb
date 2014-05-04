
class AdminMessage < ActiveRecord::Base
  self.table_name = 'admin_messages'
  belongs_to :user

  def self.for_user(user)
    if user.admin?
      all
    else
      user.admin_messages
    end
  end

  def updatable_attributes
    { message: message }
  end
end
