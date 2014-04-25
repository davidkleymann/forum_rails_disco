class BanUserCommand
  include ActiveModel::Model
  include ActiveEvent::Command
	attributes :user_id, :ban
end