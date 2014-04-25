
class Post < ActiveRecord::Base
  self.table_name = 'posts'
  
  belongs_to :topic
  
  def self.from_user(user_id)
    where(user_id: user_id)
  end
  
  def self.posted_since(time = 1.minute.ago)
    where(arel_table[:created_at].gt time)
  end

  def updatable_attributes
    attributes.slice(*%w(id title text user_id topic_id))
  end
end
