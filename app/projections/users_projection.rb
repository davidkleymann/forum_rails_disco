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
    rate = event.ban ? 1 : 2
    User.find(event.user_id).update! ban: event.ban, rate: rate
  end

  def created_adminmessage_event(event)
    user = User.find(event.user_id)
    user.update!(rate: 0) if user.ban
  end

end
