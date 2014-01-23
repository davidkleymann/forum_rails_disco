
class TopicProjection
  include ActiveProjection::ProjectionType

puts "TopicsProjections-started"
    def deleted_topic_event(event)
      Topic.find(event.id).destroy!
    end

    def updated_topic_event(event)
      Topic.find(event.id).update! event.values
    end

    def created_topic_event(event)
      Topic.create! event.values.merge(id: event.id)
    end

    puts "TopicsProjections-passed"
  
end

