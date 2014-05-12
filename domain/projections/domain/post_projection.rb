module Domain
  class PostProjection

    include ActiveDomain::Projection

    def deleted_post_event(event)
      Post.find(event.id).destroy!
    end

    def updated_post_event(event)
      Post.find(event.id).update! title: event.title
    end

    def created_post_event(event)
      Post.create! id: event.id, title: event.title
    end
  end
end

