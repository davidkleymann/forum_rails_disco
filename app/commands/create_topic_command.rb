
class CreateTopicCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'topic'
  attributes :id, :title, :user_id, :thema_id
end
