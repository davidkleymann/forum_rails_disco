
class UpdatePostsCommand
  include ActiveEvent::Command
  attributes :id, :title, :htext, :time, :user
end
