
class Topic < ActiveRecord::Base
  self.table_name = 'topics'

  has_many :posts
  
  belongs_to :thema
  belongs_to :user
end
