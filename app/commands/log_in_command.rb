
class LogInCommand
  include ActiveEvent::Command
  attributes :id, :Benutzername, :Passwort
  def valid?
  	puts 'Passwort uberprueft'
    puts 'Passwort uberprueft2'
    user = Domain::User.first
    puts "userpw: #{user.Passwort}"
    puts "pw: #{:Passwort}"
    user.Passwort == :Passwort
  end
end
