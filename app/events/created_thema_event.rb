
class CreatedThemaEvent
  include ActiveEvent::EventType
  attributes :id, :title, :description, :lastact

  def values
    attributes_except :id
  end
end
