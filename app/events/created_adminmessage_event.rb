
class CreatedAdminmessageEvent
  include ActiveEvent::EventType
  attributes :id, :message, :user

  def values
    attributes_except :id
  end
end
