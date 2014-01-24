class PostUpdateCommand
  include ActiveEvent::Command
  attributes :id, :title, :text, :user_id, :time
end
