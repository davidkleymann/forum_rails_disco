
class CreatePostsCommand
  include ActiveEvent::Command
  attributes :id, :title, :htext, :time, :user


  attributes :name, :password
  def valid?
    User.where(name: name, password: password).any?
  end
end
