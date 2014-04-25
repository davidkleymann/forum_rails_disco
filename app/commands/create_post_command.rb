class CreatePostCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Post'
  attributes :id, :title, :text, :created_at, :user_id, :topic_id
end
