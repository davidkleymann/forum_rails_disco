
class UpdatedThemaEvent
  include ActiveEvent::EventType
  attributes :id, :title, :description, :lastact, :belong

  def values
    attributes_except :id
  end
end
