class LogInCommand
  include ActiveEvent::Command
  attributes :id, :benutzername, :passwort
end
