
class LastPost < ActiveRecord::Base
  self.table_name = 'last_posts'
  belongs_to :user
  has_many :posts
  
  belongs_to :thema
end
