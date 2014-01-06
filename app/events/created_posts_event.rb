
class CreatedPostsEvent
  include ActiveEvent::EventType
  attributes :id, :title, :htext, :time, :user

  def values
    attributes_except :id
  end
end
