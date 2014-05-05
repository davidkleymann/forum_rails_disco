class TopicProjection
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
    Topic.create! event.values.merge(id: event.id, benutzername: user.benutzername, gravatar_id: gravatar)
  end

  def created_post_event(event)
    update_count(event)
  end

  def updated_post_event(event)
    update_count(event)
  end

  def deleted_post_event(event)
    update_count(event)
  end

  private

  def update_count(event)
    # TODO: needs to be fixed!
    # if ... workaround for letting the projections run
    if event.topic_id
      topic = Topic.find(event.topic_id)
      time = Time.now - 1.day
      count24 = Post.where(topic_id: event.topic_id).posted_since(time).count
      topic.update! count: topic.count + 1, count24: count24
    end
  end

end
