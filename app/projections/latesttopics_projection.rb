class LatesttopicsProjection
  include ActiveProjection::ProjectionType

  begin
    def created_topic_event(event)
      find
      Latesttopic.create! event.values.merge(id: event.id)
    end
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
