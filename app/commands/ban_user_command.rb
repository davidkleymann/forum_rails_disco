class BanUserCommand
	include ActiveEvent::Command
	attributes :id, :ban
end