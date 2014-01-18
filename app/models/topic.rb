
class Topic < ActiveRecord::Base
  self.table_name = 'topics'

  has_many :posts
end
