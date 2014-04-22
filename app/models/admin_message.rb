
class AdminMessage < ActiveRecord::Base
  self.table_name = 'admin_messages'
  belongs_to :user
end
