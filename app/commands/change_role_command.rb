class ChangeRoleCommand
  include ActiveModel::Model
	include ActiveEvent::Command

  form_name 'Role'
  attributes :user_id, :typ

  def persisted?; true end
  alias_method :id, :user_id
end
