
class UpdateTopicCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'topic'
  attributes :id, :title, :user_id, :thema_id
  
  def persisted?; true end
end
