class ChangeRoleCommand
  include ActiveModel::Model
	include ActiveEvent::Command
	attributes :user_id, :typ
end