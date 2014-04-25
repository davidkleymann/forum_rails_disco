
class UpdateThemaCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  attributes :id, :title, :description, :lastact, :belong

  def persisted?; true end
end
