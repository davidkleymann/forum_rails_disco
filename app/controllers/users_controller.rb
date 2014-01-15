class UsersController < ApplicationController
  def index
  end

  def login
  	inlog = LogInCommand.new({Benutzername: params[:Benutzername], Passwort: params[:Passwort] })
  	if id = Domain.run_command(inlog)
  		session[:User] = params[:Benutzername] #Das muss anders werden!!!
  		redirect_to action: :userpage
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
    if user.valid?
      puts 'Gueltig'
      Domain.run_command(user)
      flash[:notice] = 'Sie haben sich erfolgreich registriert.'
      puts 'fertig'
      redirect_to action: :index
    else
      flash[:error] ='Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      redirect_to action: :new
    end
  end

  def userpage
    @lastposts = Lastpost.where("user=?",params[:Benutzername]).limit(10).order(time: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:Vorname, :Name, :Email, :Benutzername, :Passwort)
  end
end