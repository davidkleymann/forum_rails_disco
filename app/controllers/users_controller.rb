class UsersController < ApplicationController

  before_action :authenticate, only: [:userpage, :edit, :update, :show, :delete, :banned, :ban, :change_typ]
  before_action :require_admin, only: [:show, :delete]
  before_action :validate_user, only: [:edit, :update]
  before_action :require_superer, only: [:ban, :change_typ]

#CRUD- Methoden

  def index
  end

  def show
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    tuser User.find(params[:id])
    user = UpdateUserCommand.new user_params.merge(id: params[:id], typ: tuser.type, ban: tuser.ban)
    if user.valid?
      Domain.run_command(user)
      flash[:notice] = 'Daten erfolgreich geaendert'
      redirect_to userpage_users_path
    else
      flash[:error] ='Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      redirect_to edit_user_path
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
    redirect_to userpage_users_path
  end
  
  def create
    user = RegisterUserCommand.new user_params.merge(typ: 0, ban: false)
    if user.valid?
      Domain.run_command(user)
      flash[:notice] = 'Sie haben sich erfolgreich registriert.'
      redirect_to users_path
    else
      flash[:error] ='Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      redirect_to new_user_path
    end
  end
  
#Sonstige Methoden

  def login
    inlog = LogInCommand.new({benutzername: params[:benutzername], passwort: params[:passwort]})
    if inlog.valid? && Domain.run_command(inlog)
      user = User.where(benutzername: params[:benutzername]).first 
      session[:user] = user.id
      if user.banned?
        session[:banned_rate] = true if user.rate == 1
        redirect_to banned_users_path
      else
        if params[:merk].nil? || params[:merk] == users_path
          redirect_to userpage_users_path
        else
          redirect_to params[:merk]
        end
      end
    else
      flash[:error] = 'Fehler: Falscher Benutzername und/oder falsches Passwort!'
      redirect_to users_path(merk: params[:merk])
    end
  end

  def userpage
    @lastposts = Lastpost.where("user_id=?", session[:user]).order(created_at: :desc)
    if current_user.admin?
      @adminmessages = Adminmessage.all
      @admin = true
    else
      @adminmessages = current_user.adminmessages
    end
  end
  
  def logout
    reset_session
    flash[:notice] = 'Sie haben sich erfolgreich ausgelogt!'
    redirect_to users_path
  end
  
  def ban
    ban = BanUserCommand.new(user_id: params[:id], ban: params[:ban])
    Domain.run_command(ban)
    if params[:ban]
      flash[:notice] = "Der Nutzer mit der id #{params[:id]} wurde gesperrt!"
    else
      flash[:notice] = "Der Nutzer mit der id #{params[:id]} wurde entsperrt!"
    end
    redirect_to user_path(id: 1)
  end

  def banned
    @permitted = User.find(session[:user]).rate == 1 && session[:banned_rate]
    @adminmessage = Adminmessage.new if @permitted
  end

  def change_typ
    change = ChangeTypCommand.new(user_id: params[:id], typ: params[:typ])
    if cahnge.valid?
      Domain.run_command(change)
      case typ
        when 0 then  flash[:notice] = "Der Nutzer mit der id #{params[:id]} ist jetzt ein normaler Nutzer."
        when 1 then flash[:notice] = "Der Nutzer mit der id #{params[:id]} ist jetzt ein Moderator"
        when 2 then flash[:notice] = "Der Nutzer mit der id #{params[:id]} ist jetzt ein Forum-Administrator."
      end
      redirect_to user_path(id: 1)
    else
      flash[:error] = "Ein Fehler trat auf"
      redirect_to user_path(id: 1)
    end
  end

private
  
  def validate_user
    puts "id: #{params[:id]}"
    puts "current id: #{current_user.id}"
    unless current_user.id == params[:id] # && !(current_user.admin?)
      redirect_to action: :index
      flash[:error] = 'Sie haben nicht die benoetigten Rechte, um diese Aktion durchzufuehren!' 
    end 
  end
  
  def user_params
    params.require(:user).permit(:vorname, :name, :email, :benutzername, :passwort)
  end

  def require_superer
    if current_user.superer?(User.find(params[:id]).typ)
      flash[:error] ='Sie haben nicht die benoetigten Rechte, um diese Aktion durchzufuehren!'
      redirect_to userpage_users_path
    end
  end
  
end
