
class CreateThemaCommand
  include ActiveEvent::Command
  attributes :id, :title, :description, :lastact, :belong
end
