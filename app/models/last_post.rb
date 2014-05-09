
class LastPost < ActiveRecord::Base
  self.table_name = 'last_posts'
  belongs_to :user
  has_many :posts

  def self.for_user(user)
    where(user_id: user.id).order(created_at: :desc)
  end
end
