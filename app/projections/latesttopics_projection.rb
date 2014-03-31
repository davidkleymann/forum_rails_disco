class LatesttopicsProjection
  include ActiveProjection::ProjectionType

  def created_topic_event(event)
    find
    Latesttopic.create! event.values.merge(id: event.id)
  end
  def deleted_topic_event(event)
    find
    Latesttopic.find(event.id).destroy!
  end

  private

  def find
    @Latesttopic = Latesttopic.order(:created_at)
    if @Latesttopic.length == 3
      id = @Latesttopic[3].id
      Latesttopic.find(id).destroy!
    end
  end
end
