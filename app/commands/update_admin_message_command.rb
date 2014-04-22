class UpdateAdminMessageCommand
  include ActiveEvent::Command
  attributes :id, :message, :user_id
end
