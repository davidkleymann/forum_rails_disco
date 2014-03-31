
class Post < ActiveRecord::Base
  self.table_name = 'posts'
  
  belongs_to :topic
  
  def self.from_user(user_id)
    where(user_id: user_id)
  end
  
  def self.posted_since(time)
    where(arel_table[:created_at].gt 1.minute.ago)
  end
end
