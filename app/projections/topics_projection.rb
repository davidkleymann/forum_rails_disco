class TopicsProjection
  include ActiveProjection::ProjectionType

  def deleted_topic_event(event)
    Topic.find(event.id).destroy!
  end

  def updated_topic_event(event)
    Topic.find(event.id).update! event.values
  end

  def created_topic_event(event)
     user = User.find(event.user_id)
     require 'digest/md5'
     gravatar = Digest::MD5.hexdigest(user.email.downcase)
    Topic.create! event.values.merge(id: event.id, benutzername: usser.benutzername, gravatar_id: gravatar)
  end
end
