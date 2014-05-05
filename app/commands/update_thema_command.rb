
class UpdateThemaCommand
  include ActiveModel::Model
  include ActiveEvent::Command

  form_name 'Thema'
  attributes :id, :title, :description, :lastact, :belong

  def persisted?; true end
end
