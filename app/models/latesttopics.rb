
class Latesttopics < ActiveRecord::Base
  self.table_name = 'latesttopics'
  has_many :posts
  
  belongs_to :thema
  belongs_to :user
end