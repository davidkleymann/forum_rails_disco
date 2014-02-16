
class CreatedTopicEvent
  include ActiveEvent::EventType
  attributes :id, :title, :user_id, :thema_id

  def values
    attributes_except :id
  end
end
