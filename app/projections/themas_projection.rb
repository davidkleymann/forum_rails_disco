
class ThemaProjection
  include ActiveProjection::ProjectionType

    def deleted_thema_event(event)
      Thema.find(event.id).destroy!
    end

    def updated_thema_event(event)
      Thema.find(event.id).update! event.values
    end

    def created_thema_event(event)
      Thema.create! event.values.merge(id: event.id)
    end
  
end

