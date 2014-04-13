class UsersController < ApplicationController

  before_action :authenticate, only: [:userpage, :edit, :update, :show, :delete]
  before_action :require_admin, only: [:show, :delete, :ban]
  before_action :validate_user, only: [:edit, :update]

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
    user = UpdateUserCommand.new user_params.merge(id: params[:id])
    if user.valid?
      Domain.run_command(user)
      flash[:notice] = 'Daten erfolgreich geaendert'
      redirect_to action: :userpage
    else
      flash[:error] ='Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      redirect_to action: :edit
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
  
  def create
    user = RegisterUserCommand.new user_params.merge(typ: 0, ban: true)
    if user.valid?
      Domain.run_command(user)
      flash[:notice] = 'Sie haben sich erfolgreich registriert.'
      redirect_to action: :index
          UserMailer.registermail(User.all.where('benutzername = ?', user.benutzername).first).deliver
    else
      flash[:error] ='Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      redirect_to action: :new
    end
  end
  
#Sonstige Methoden

  def login
    inlog = LogInCommand.new({benutzername: params[:benutzername], passwort: params[:passwort]})
    if inlog.valid? && Domain.run_command(inlog)
      @id = User.where(benutzername: params[:benutzername]).first.id
      session[:user] = @id
      if params[:merk].nil? || params[:merk] == users_path
        redirect_to userpage_user_path(id: @id)
      else
        redirect_to params[:merk]
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
    flash[:notice] = 'Sie haben sich erfolgreich ausgeloggt!'
    redirect_to users_path
  end
  
  def ban
    ban = BanUserCommand.new(user_id: params[:id])
    Domain.run_command(ban)
    flash[:notice] = "Der Nutzer mit der id #{params[:id]} wurde gesperrt!"
    redirect_to user_path(id: 1)
  end

  def unban
    unban = UnbanUserCommand.new(user_id: params[:id])
    Domain.run_command(unban)
    flash[:notice] = "Der Nutzer mit der id #{params[:id]} wurde entsperrt!"
    redirect_to user_path(id: 1)
  end

private
  def regmail

  end

  def validate_user
    puts "Userdata: #{params[:id]}"
    puts "Cu: #{current_user.id}"
    if current_user.id.to_s != params[:id]  && !current_user.admin?
      redirect_to action: :index
      flash[:error] = 'Sie haben nicht die benoetigten Rechte, um diese Aktion durchzufuehren!' 
    end 
  end
  
  def user_params
    params.require(:user).permit(:vorname, :name, :email, :benutzername, :passwort)
  end
  
end