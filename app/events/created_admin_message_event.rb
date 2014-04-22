
class CreatedAdminMessageEvent
  include ActiveEvent::EventType
  attributes :id, :message, :user_id

  def values
    attributes_except :id
  end
end
