
class Lastpost < ActiveRecord::Base
  self.table_name = 'lastposts'
  belongs_to :user
end
