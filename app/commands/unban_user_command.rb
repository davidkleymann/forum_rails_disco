class UnbanUserCommand
  include ActiveEvent::Command
  attributes :user_id
end
