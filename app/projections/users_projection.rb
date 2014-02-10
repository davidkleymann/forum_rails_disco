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
end
