class UpdateUserCommand
  include ActiveModel::Model
  include ActiveEvent::Command

  form_name 'User'
  attributes :id, :name, :vorname, :email, :benutzername, :passwort

  def persisted?; true end
end
