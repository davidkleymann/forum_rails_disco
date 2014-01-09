
class TopicProjection
  include ActiveProjection::ProjectionType

    def post_destroy_event(event)
      Topic.find(event.id).destroy!
    end

    def post_create_event(event)
      Topic.create! event.values.merge(id: event.id)
    end
end

