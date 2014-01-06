
class UsersController < ApplicationController
  def index
  end

  def login
  	inlog = LogInCommand.new({Benutzername: params[:Benutzername], Passwort: params[:Passwort] })
  	if inlog.valid? and id = Domain.run_command(inlog)
  		session[:User] = params[:Benutzername] #Das muss anders werden!!!
  		redirect_to action: :Userpage
  	else
  		flash[:error] = 'Fehler: Falscher Benutzername und/oder falsches Passwort!'
  		redirect_to action: :index
  	end
  end

  def new
  	@user = User.new
  end

  def create
    user = RegisterUserCommand.new user_params
    
  end

  private

  def user_params
    params.require(:user).permit(:Vorname, :Name, :Email, :Benutzername, :Passwort)
  end

end