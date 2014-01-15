
class LogInEvent
  include ActiveEvent::EventType
  attributes :id, :Benutzername, :Passwort

  def values
    attributes_except :id
  end
end
