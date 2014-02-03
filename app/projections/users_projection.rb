class UserProjection
  include ActiveProjection::ProjectionType
  
  def register_user_event(event)
	values = event.values.merge(id:event.id)
	values.delete(:passwort)
	User.create! values	
  end
end