class SubscriptionProjection
  include ActiveProjection::ProjectionType

  def deleted_subscription_event(event)
    Subscription.find(event.id).destroy!
  end

  def updated_subscription_event(event)
    Subscription.find(event.id).update! event.values
  end

  def created_subscription_event(event)
    Subscription.create! event.to_hash.merge(topic_name: Topic.find(event.topic_id).title)
  end
  
end
