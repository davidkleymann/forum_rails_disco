
class AdminmessageProjection
  include ActiveProjection::ProjectionType

    def deleted_adminmessage_event(event)
      Adminmessage.find(event.id).destroy!
    end

    def updated_adminmessage_event(event)
      Adminmessage.find(event.id).update! event.values
    end

    def created_adminmessage_event(event)
      Adminmessage.create! event.values.merge(id: event.id)
    end
  
end

