
class DeletedThemaEvent
  include ActiveEvent::EventType
  attributes :id 

  def values
    attributes_except :id
  end
end
