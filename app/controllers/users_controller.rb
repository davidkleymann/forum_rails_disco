class UsersController < ApplicationController

  before_action :authenticate, only: [:userpage, :edit]
  before_action :authenticate_admin, only: [:show, :delete]
  before_action :authenticate_user, only: [:edit, :update]

  def index
  end

  def show
    @users = User.all
  end

  def login
  	inlog = LogInCommand.new({benutzername: params[:benutzername], passwort: params[:passwort]})
  	if inlog.valid? && Domain.run_command(inlog)
      @id = User.where(benutzername: params[:benutzername]).first.id
  		session[:user] = @id
      if params[:merk].nil?
        redirect_to action: :userpage
      else
        redirect_to params[:merk]
      end
  	else
  		flash[:error] = 'Fehler: Falscher Benutzername und/oder falsches Passwort!'
      redirect_to users_path(merk: params[:merk])
  	end
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    type = User.find(params[:id]).typ
    user = UpdateUserCommand.new user_params.merge(id: params[:id], typ: type)
    if user.valid?
      Domain.run_command(user)
      flash[:notice] = 'Daten erfolgreich geaendert'
      redirect_to action: :userpage
    else
      flash[:error] ='Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      redirect_to action: :edit
    end 
  end

  def create
    user = RegisterUserCommand.new user_params.merge(typ: 0)
    if user.valid?
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
    @lastposts = Lastpost.where("user_id=?", @id).order(time: :desc)
    @user = User.find(session[:user])
    if @user.typ == 1
      @adminmessages = Adminmessage.all
      @admin = true
    else
      @adminmessages = @User.Adminmessages
    end
  end

  def delete
    user = DeleteUserCommand.new({id: params[:id]})
    if id = Domain.run_command(user)
      session[:tmp_event_id] = id
      flash[:notice] = 'User was successfully deleted.'
    else
      flash[:error] = 'User couldn\'t be deleted.'
    end
    redirect_to action: :index
  end
  
  def logout
    reset_session
    flash[:notice] = 'Sie haben sich erfolgreich ausgelogt!'
    redirect_to users_path
  end

  private

  def authenticate
    temp = session[:user]
    if temp.nil?
      redirect_to users_path(merk: request.original_url)
      flash[:error] = 'Fehler:bitte einloggen'
    end
  end

  def authenticate_admin
    temp = session[:user]
    if temp.nil?
      redirect_to users_path(merk: request.original_url)
      flash[:error] = 'Fehler:bitte einloggen'
    else
      redirect_to action: :index unless User.find(session[:user]).typ == 1
    end
  end

  def authenticate_user
    unless session[:user] == params[:id] || User.find(session[:user]).typ == 1
      redirect_to action: :index
      flash[:error] = 'Sie haben nicht die benoetigten Rechte, um diese Aktion durchzufuehren!' 
    end
  end

  def user_params
    params.require(:user).permit(:vorname, :name, :email, :benutzername, :passwort)
  end
end