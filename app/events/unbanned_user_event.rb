class UnbannedUserEvent
  include ActiveEvent::EventType
  attributes :user_id
  def values
    to_hash
  end
end
