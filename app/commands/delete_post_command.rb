
class DeletePostCommand
  include ActiveEvent::Command
  attributes :id, :topic_id
end
