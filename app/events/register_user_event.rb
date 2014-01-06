
class RegisterUserEvent
  include ActiveEvent::EventType
  attributes :id, :Name, :Vorname, :Email, :Benutzername, :Passwort

  def values
    attributes_except :id
  end
end
