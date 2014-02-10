class TopicProjection
  include ActiveProjection::ProjectionType

  def deleted_topic_event(event)
    Topic.find(event.id).destroy!
  end

  def updated_topic_event(event)
    Topic.find(event.id).update! event.values
  end

  def topic_create_event(event)
    Topic.create! event.values.merge(id: event.id)
  end
end
