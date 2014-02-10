module Domain
  class UserProjection
	include ActiveDomain::Projection
	
	  def register_user_event(event)
		  User.create! id: event.id, benutzername: event.benutzername, passwort: event.passwort	
    end

    def updated_user_event(event)
      User.find(event.id).Update! id: event.id, benutzername: event.benutzername, passwort: event.passwort 
    end

    def deleted_user_event(event)
    	User.find(event.id).destroy!
    end
  end
end
