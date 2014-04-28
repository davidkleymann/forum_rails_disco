module SubscriptionValidations
  extend ActiveSupport::Concern
  include ActiveEvent::Validations

  validation_target :'CreateSubscriptionCommand'

  included do 
  	validate :unique_subscription
  end

  def unique_subscription
  	errors.add(:base, "Sie verfolgen dises Diskussion bereits!") if Subscription.where("user_id = ? AND topic_id = ?", user_id, topic_id).exists?
  end
end