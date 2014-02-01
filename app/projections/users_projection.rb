class UserProjection
  include ActiveProjection::ProjectionType
  
  def register_user_event(event)
    puts 'RAils - Projection 1'
    values = event.values.merge(id: event.id)
    values.delete(:passwort)
    User.create! values
    puts 'RAils - Projection'		
  end
end

