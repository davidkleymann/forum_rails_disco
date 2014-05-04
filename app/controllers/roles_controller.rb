class RolesController < ApplicationController
  include EventSource
  before_action :authenticate
  before_action :require_superior
  before_action :fetch_user
  
  def edit
    @role = ChangeRoleCommand.new(user_id: @user.id, typ: @user.typ)
  end

  def update
  	@role = ChangeRoleCommand.new(role_params.merge(user_id: @user.id))
		if store_event_id Domain.run_command(@role)
			redirect_to @user, notice: "Typ erfolgreich geändert"
    else
      render 'edit'
		end
	end

  private

  def role_params
    params.require(:role).permit(:typ)
  end

  def fetch_user
    @user = User.find params[:id]
  end
end
