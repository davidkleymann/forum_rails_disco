class UserProjection
  include ActiveProjection::ProjectionType
  
  def register_user_event(event)
<<<<<<< HEAD
	values = event.values.merge(id:event.id)
	values.delete(:passwort)
	User.create! values	
=======
    puts 'RAils - Projection 1'
    values = event.values.merge(id: event.id)
    values.delete(:passwort)
    User.create! values
    puts 'RAils - Projection'		
>>>>>>> d6c676ff2d2fea178b5423709a41d1a5ba6e26e0
  end
end
