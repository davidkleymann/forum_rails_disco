class ChangeRoleCommand
	include ActiveEvent::Command
	attributes :user_id, :typ
end