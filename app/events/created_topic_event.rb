
class CreatedTopicEvent
  include ActiveEvent::EventType
  attributes :id, :title, :user_id

  def values
    attributes_except :id

    pust "CreatedTopicEvent"
  end
end
