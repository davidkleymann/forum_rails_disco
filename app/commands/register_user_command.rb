
class RegisterUserCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'User'
  attributes :id, :name, :vorname, :email, :benutzername, :passwort, :typ, :shash
end
