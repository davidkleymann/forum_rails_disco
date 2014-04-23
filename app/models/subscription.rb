class Subscription < ActiveRecord::Base
  self.table_name = 'subscriptions'
  belongs_to :user
  has_many :subscribedposts
end
