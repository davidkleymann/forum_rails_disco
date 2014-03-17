class TopicsProjection
  include ActiveProjection::ProjectionType

  def deleted_topic_event(event)
    Topic.find(event.id).destroy!
  end

  def updated_topic_event(event)
    Topic.find(event.id).update! event.values
  end

  def created_topic_event(event)
    benutzername = User.find(event.user_id).benutzername
    Topic.create! event.values.merge(id: event.id, benutzername: benutzername)
  end
end
