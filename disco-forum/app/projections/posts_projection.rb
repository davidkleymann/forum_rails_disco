
class PostsProjection
  include ActiveProjection::ProjectionType

    def deleted_posts_event(event)
      Posts.find(event.id).destroy!
    end

    def updated_posts_event(event)
      Posts.find(event.id).update! event.values
    end

    def created_posts_event(event)
      Posts.create! event.values.merge(id: event.id)
    end
  
end

