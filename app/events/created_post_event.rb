
class CreatedPostEvent
  include ActiveEvent::EventType
  attributes :id, :title, :text, :user_id, :created_at, :topic_id

  def values
    attributes_except :id
  end
end
