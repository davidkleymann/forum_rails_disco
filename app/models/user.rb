class User < ActiveRecord::Base
  self.table_name = 'users'
  has_many :lastposts
  has_many :adminmessages
end
