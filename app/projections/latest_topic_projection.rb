class LatestTopicProjection
  include ActiveProjection::ProjectionType

  def created_topic_event(event)
    find
    LatestTopic.create! event.values.merge(id: event.id)
  end
  def deleted_topic_event(event)
    find
    LatestTopic.find(event.id).destroy!
  end

  private

  def find
    @latest_topic = LatestTopic.order(:created_at)
    if @latest_topic.length == 3
      id = @latest_topic[2].id
      LatestTopic.find(id).destroy!
    end
  end
end
