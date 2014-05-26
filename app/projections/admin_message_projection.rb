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
    user = User.find(event.user_id)
    user.rate -= 1 if user.rate > 0
    user.save!
  end

end

