
class UpdatePostCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  
  form_name 'Post'
  attributes :id, :title, :text, :updated_at, :user_id, :topic_id, :editor_id

  def persisted?; true end
end
