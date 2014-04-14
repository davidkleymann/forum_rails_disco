class CreateSubscriptionCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Subscription'
  attributes :user_id, :email
end
