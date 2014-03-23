class ChangedTypEvent
	include ActiveEvent::EventType
	attributes :user_id, :typ
	
	def values
    attributes_except :id
  end
end