module Domain
  class UserProjection
	include ActiveDomain::Projection
	
	def register_user_event(event)
		User.create! id: event.id, benutzername: event.benutzername, passwort: event.passwort	
	end

  end
end
