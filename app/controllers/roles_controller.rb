class RolesController < ApplicationController
  
  before_action :authenticate_admin
  
  def edit
    change = ChangeTypCommand.new role_params
    if User.find(session[:user]).superior?(User.find(params[:id]).typ)
  
end