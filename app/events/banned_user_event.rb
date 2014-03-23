class BannedUserEvent

	include ActiveEvent::EventType
  attributes :user_id, :ban

  def values
    attributes_except :id
  end
  
end