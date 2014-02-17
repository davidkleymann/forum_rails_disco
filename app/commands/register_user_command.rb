
class RegisterUserCommand
  include ActiveEvent::Command
  attributes :id, :name, :vorname, :email, :benutzername, :passwort, :typ
end
