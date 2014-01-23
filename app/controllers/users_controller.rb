class UsersController < ApplicationController

  before_action :authenticate, only: [:userpage]

  def index
  end

  def show
    redirect_to action: :index
  end

  def login
  	inlog = LogInCommand.new({Benutzername: params[:Benutzername], Passwort: params[:Passwort]})
    puts "id: #{Domain.run_command(inlog)}" #Falsche id
  	if inlog.valid?
      Domain.run_command(inlog)
      @id = User.select("id").where("Benutzername = ?", params[:Benutzername])
  		session[:user] = @id
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
    @lastposts = Lastpost.where("user_id_id=?", @id).order(time: :desc)
  end

  private

  def authenticate
    temp = session[:user]
    if temp.nil?
      redirect_to controller: :users, action: :index
      flash[:error] = 'Fehler:bitte einloggen'
    end
  end 

  def user_params
    params.require(:user).permit(:Vorname, :Name, :Email, :Benutzername, :Passwort)
  end
end