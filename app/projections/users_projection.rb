class UserProjection
  include ActiveProjection::ProjectionType
  
  def register_user_event(event)
  	values = event.values.merge(id:event.id)
	 	values.delete(:passwort)
	 	User.create! values	
  end

  def updated_user_event(event)
  	values = event.values
  	values.delete(:passwort)
  	User.find(event.id).update! values
  end

  def deleted_user_event(event)
    User.find(event.id).destroy!
  end

  def banned_user_event(event)
    User.find(event.user_id).update! ban: true, rate: 1
  end
  
  def unbanned_user_event(event)
    User.find(event.user_id).update! ban: false
  end

  def created_adminmessage_event(event)
    user = User.find(event.user_id)
    user.update!(rate: 0) if user.ban
  end
  
  def changed_role_event(event)
    User.find(event.user_id).update! typ: event.typ
  end
end
