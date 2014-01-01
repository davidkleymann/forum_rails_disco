class PostUpdateCommand
  include ActiveEvent::Command
  attributes :id, :title, :text, :user, :time
end
