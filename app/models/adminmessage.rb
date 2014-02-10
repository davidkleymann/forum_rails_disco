
class Adminmessage < ActiveRecord::Base
  self.table_name = 'adminmessages'
  belongs_to :user
end
