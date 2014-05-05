class BanUserCommand
  include ActiveEvent::Command
	attributes :user_id, :ban
end
