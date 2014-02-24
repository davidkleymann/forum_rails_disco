
class Post < ActiveRecord::Base
  self.table_name = 'posts'
  
  belongs_to :topic
end
