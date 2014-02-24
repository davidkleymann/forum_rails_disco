class LatesttopicsProjection
  include ActiveProjection::ProjectionType

  def created_topic_event(event)
    find
    Latesttopic.create! event.values.merge(event.id)
  end

  private

  def find
    @Latesttopic = Latesttopic.order(time: :desc)
    if @Latesttopic.length == 3
      id = @Latesttopic[3].id
      Latesttopic.find(id).destroy!
    end
  end
end
