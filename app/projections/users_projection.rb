class UserProjection
  include ActiveProjection::ProjectionType
  
  def register_user_event(event)
  	puts 'RAils - Projection 1'
    User.create! event.values.merge(id: event.id)
    puts 'RAils - Projection'		
  end
end

