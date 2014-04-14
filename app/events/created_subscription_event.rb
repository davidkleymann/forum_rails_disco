class CreatedSubscriptionEvent
  include ActiveEvent::EventType
  attributes :id, :user_id, :email
  def values
    attributes_except :id
  end
end
