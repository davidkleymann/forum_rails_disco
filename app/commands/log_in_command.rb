class LogInCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  attributes :id, :benutzername, :passwort
end
