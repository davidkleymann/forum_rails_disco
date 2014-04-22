class Subscriptpost < ActiveRecord::Base
  self.table_name = 'subscriptposts'
  belongs_to :subscription
end
