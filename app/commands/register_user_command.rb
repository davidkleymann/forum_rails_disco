
class RegisterUserCommand
  include ActiveEvent::Command
  attributes :id, :Name, :Vorname, :Email, :Benutzername, :Passwort
end
