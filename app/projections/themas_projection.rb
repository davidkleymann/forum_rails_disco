
class ThemasProjection
  include ActiveProjection::ProjectionType
  
  def deleted_thema_event(event)
    Thema.find(event.id).destroy!
  end
  
  def updated_thema_event(event)
    Thema.find(event.id).update! event.values
  end
  
  def created_thema_event(event)
    Thema.create! event.values.merge(id: event.id)
  end
  
  def created_post_event(event)
    Thema.find(Topic.find(event.topic_id).thema_id).update!(lastpost_time: event.created_at,
      lastpost_user: User.find(event.user_id).benutzername)
  end
  
  #def deleted_post_event(event)
  #  Post.join(:topic).where(topic:{thema_id: event.id)
    
  
end

