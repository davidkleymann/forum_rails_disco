module Domain
  module SubscriptionValidations
    extend ActiveSupport::Concern
    include ActiveEvent::Validations

    validation_target :'CreateSubscriptionCommand'

    included  do
    	skip_validate :unique_subscription
    end
  end
end