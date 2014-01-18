class PostUpdateEvent
  include ActiveEvent::EventType
  attributes :id, :title, :text, :user_id, :time

  def values
    attributes_except :id
  end
end
