
class CreateAdminmessageCommand
  include ActiveEvent::Command
  attributes :id, :message, :user_id
end
