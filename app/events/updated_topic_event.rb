
class UpdatedTopicEvent
  include ActiveEvent::EventType
  attributes :id, :title, :user_id

  def values
    attributes_except :id
  end
end
