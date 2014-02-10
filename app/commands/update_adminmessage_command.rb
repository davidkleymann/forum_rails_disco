
class UpdateAdminmessageCommand
  include ActiveEvent::Command
  attributes :id, :message, :editor_id
end
