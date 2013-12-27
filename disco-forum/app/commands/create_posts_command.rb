
class CreatePostsCommand
  include ActiveEvent::Command
  attributes :id, :title, :htext, :time, :user
end
