
class Lastpost < ActiveRecord::Base
  self.table_name = 'lastposts'
  belongs_to :user
  has_many :posts
  
  belongs_to :thema
end
