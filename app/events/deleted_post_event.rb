
class DeletedPostEvent
  include ActiveEvent::EventType
  attributes :id, :topic_id

  def values
    attributes_except :id
  end
end
