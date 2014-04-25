class CreateAdminMessageCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'AdminMessage'
  attributes :id, :message, :user_id
end
