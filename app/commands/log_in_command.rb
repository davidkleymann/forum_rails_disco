class LogInCommand
  include ActiveModel::Model
  include ActiveEvent::Command

  form_name 'User'
  attributes :id, :benutzername, :passwort
end
