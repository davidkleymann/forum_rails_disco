class CreatedSubscriptionEvent
  include ActiveEvent::EventType
  attributes :id, :user_id, :email, :topic_id
  def values
    attributes_except :id
  end
end
