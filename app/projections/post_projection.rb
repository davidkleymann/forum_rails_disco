
class PostProjection
  include ActiveProjection::ProjectionType

  def deleted_post_event(event)
      Post.find(event.id).destroy!
    end

    def updated_post_event(event)
      Post.find(event.id).update! event.values
    end

    def created_post_event(event)
      benutzername = User.find(event.user_id).benutzername
      Post.create! event.values.merge(id: event.id, benutzername: benutzername)
    end
end

