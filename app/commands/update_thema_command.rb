
class UpdateThemaCommand
  include ActiveEvent::Command
  attributes :id, :title, :description, :lastact, :belong
end
