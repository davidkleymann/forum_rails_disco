class PostUpdateEvent
  include ActiveEvent::EventType
  attributes :id, :title, :text, :user, :time

  def values
    attributes_except :id
  end
end
