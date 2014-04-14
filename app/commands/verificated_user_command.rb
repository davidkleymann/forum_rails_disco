class VerificatedUserCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  attributes :user_id
end
