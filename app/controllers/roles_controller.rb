class RolesController < ApplicationController
  before_action :authenticate
  before_action :require_admin
  
  def edit
  	redirect_to userpage_users_path unless @current_user.superior?(1)
  end

  def update
  	redirect_to userpage_users_path unless @current_user.superior?(1)
  	change = ChangeTypCommand.new (user_id: params[:id], typ: params[:typ])
		if change.valid?
			Domain.run_command(change)
			flash[:notice] = "Typ erfolgreich geändert"
			redirect_to users_path(user_id: 1)
		else
			flash[:error] = "Fehler: bitte überprüfen sie ihre Eingaben"
			redirect_to userpage_users_path
		end
	end

end