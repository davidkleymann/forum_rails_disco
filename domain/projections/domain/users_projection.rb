module Domain
  class UserProjection
    include ActiveDomain::Projection
    
    def register_user_event(event)
      User.create! event.values.merge(id: event.id)
      puts 'Projection'		
    end

  end
end
