module Domain
  class UserProjection
<<<<<<< HEAD
	include ActiveDomain::Projection
	
	def register_user_event(event)
		User.create! id: event.id, benutzername: event.benutzername, passwort: event.passwort	
	end
=======
    include ActiveDomain::Projection
    
    def register_user_event(event)
      User.create! id: event.id, benutzername: event.benutzername, passwort: event.passwort
      puts 'Domain- Projection'
    end
>>>>>>> d6c676ff2d2fea178b5423709a41d1a5ba6e26e0

  end
end
