
class UpdateAdminmessageCommand
  include ActiveEvent::Command
  attributes :id, :message, :user
end
