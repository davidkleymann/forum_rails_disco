
class RegisterUserEvent
  include ActiveEvent::EventType
  attributes :id, :name, :vorname, :email, :benutzername, :passwort, :typ, :ban

  def values
    attributes_except :id
  end
end
