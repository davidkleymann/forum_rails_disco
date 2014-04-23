class Subscribedpost < ActiveRecord::Base
  self.table_name = 'subscribedposts'
  belongs_to :subscription
end
