
class CreateTopicCommand
  include ActiveEvent::Command
  attributes :id, :title, :user_id
end
