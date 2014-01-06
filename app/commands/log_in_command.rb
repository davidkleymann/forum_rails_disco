
class LogInCommand
  include ActiveEvent::Command
  attributes :id, :Benutzername, :Passwort
  def valid?
    user = User.where(Benutzername: :Benutzername, Passwort: :Passwort)
  end
end
