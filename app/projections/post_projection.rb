
class PostProjection
  include ActiveProjection::ProjectionType

  def deleted_post_event(event)
    Post.find(event.id).destroy!
  end

  def updated_post_event(event)
    Post.find(event.id).update! event.values
  end

  def created_post_event(event)
    user = User.find(event.user_id)
    require 'digest/md5'
    gravatar = Digest::MD5.hexdigest(user.email.downcase)
    Post.create! event.values.merge(id: event.id, benutzername: user.benutzername, gravatar_id: gravatar)
  end
end

