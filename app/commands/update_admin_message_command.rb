class UpdateAdminMessageCommand
  include ActiveModel::Model
  include ActiveEvent::Command

  form_name 'AdminMessage'
  attributes :id, :message, :user_id

  def persisted?; true end
end
