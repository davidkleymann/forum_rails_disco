
class Topic < ActiveRecord::Base
  self.table_name = 'topics'

  has_many :posts
  
  belongs_to :thema
  belongs_to :user
  
  def updatable_attributes
    attributes.slice(*%w(id title user_id thema_id))
  end
end
