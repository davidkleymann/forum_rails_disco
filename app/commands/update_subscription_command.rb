class UpdateSubscriptionCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Subscription'
  attributes :id, :user_id, :email, :topic_id

  def persisted?; true end
end
