
class UpdatePostCommand
  include ActiveEvent::Command
  attributes :id, :title, :text, :updated_at, :user_id, :topic_id, :editor_id
end
