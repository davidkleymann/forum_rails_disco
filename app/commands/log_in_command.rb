
class LogInCommand
  include ActiveEvent::Command
  attributes :id, :Benutzername, :Passwort

  def valid?
    user = Domain::User.first
    user.Passwort == self.Passwort
  end
end
