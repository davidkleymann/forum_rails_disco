
class PostProjection
  include ActiveProjection::ProjectionType

  def delete_post_event(event)
      Post.find(event.id).destroy!
    end

    def update_post_event(event)
      Post.find(event.id).update! event.values
    end

    def create_post_event(event)
      Post.create! event.values.merge(id: event.id)
    end
end

