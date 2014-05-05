class Subscription < ActiveRecord::Base
  self.table_name = 'subscriptions'
  belongs_to :user
  has_many :subscribedposts

  def updatable_attributes
    attributes.slice(*%w(id email topic_id))
  end
end
