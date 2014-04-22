
class LatestTopic < ActiveRecord::Base
  self.table_name = 'latest_topics'
  has_many :posts
  
  belongs_to :thema
  belongs_to :user
end
