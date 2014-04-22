class AdminMessageProjection
  include ActiveProjection::ProjectionType

  def deleted_admin_message_event(event)
    AdminMessage.find(event.id).destroy!
  rescue Exception
  end

  def updated_admin_message_event(event)
    AdminMessage.find(event.id).update! event.values
  end

  def created_admin_message_event(event)
    AdminMessage.create! event.values.merge(id: event.id)
  end

end
