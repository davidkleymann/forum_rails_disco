
class RegisterUserCommand
  include ActiveEvent::Command
  attributes :id, :name, :vorname, :email, :benutzername, :passwort
end
