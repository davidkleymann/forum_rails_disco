
class UpdatedPostEvent
  include ActiveEvent::EventType
  attributes :id, :title, :text, :user_id, :time, :topic_id

  def values
    attributes_except :id
  end
end
