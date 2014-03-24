
class UpdatedUserEvent
  include ActiveEvent::EventType
  attributes :id, :name, :vorname, :email, :benutzername, :passwort

  def values
    attributes_except :id
  end
end