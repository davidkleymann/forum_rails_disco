
class Adminmessage < ActiveRecord::Base
  self.table_name = 'adminmessages'
  has_one :user
end
