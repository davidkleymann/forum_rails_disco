
class CreateAdminmessageCommand
  include ActiveEvent::Command
  attributes :id, :message, :user
end
