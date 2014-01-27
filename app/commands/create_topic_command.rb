
class CreateTopicCommand
  include ActiveEvent::Command
  attributes :id, :title, :user_id

  puts "CreateTopicCommand end"
end
