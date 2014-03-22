class BannedUserEvent

	include ActiveEvent::EventType
  attributes :id, :ban

  def values
    attributes_except :id
  end
  
end