
class UpdatedPostEvent
  include ActiveEvent::EventType
  attributes :id, :title, :text, :user_id, :updated_at, :topic_id

  def values
    attributes_except :id
  end
end
