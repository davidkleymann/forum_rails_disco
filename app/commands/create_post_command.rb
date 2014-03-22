
class CreatePostCommand
  include ActiveEvent::Command
  attributes :id, :title, :text, :created_at, :user_id, :topic_id
end
