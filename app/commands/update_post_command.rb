
class UpdatePostCommand
  include ActiveEvent::Command
  attributes :id, :title, :text, :time, :user_id, :topic_id
end
