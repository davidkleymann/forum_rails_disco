
class LogInEvent
  include ActiveEvent::EventType
  attributes :id, :benutzername, :passwort

  def values
    attributes_except :id
  end
end
