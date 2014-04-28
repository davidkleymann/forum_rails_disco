class UsersController < ApplicationController

  before_action :authenticate, only: [:userpage, :edit, :update, :show, :delete]
  before_action :require_admin, only: [:show, :delete, :ban]
  before_action :validate_user, only: [:edit, :update]

  def index  
    @user = User.new
  end

  def show
    @users = User.all
  end

  def new
  	@user = RegisterUserCommand.new
  end

  def edit
    @user = UpdateUserCommand.new User.find(params[:id]).updatable_attributes
  end

  def update
    user = UpdateUserCommand.new user_params.merge(id: params[:id])
    if user.valid?
      Domain.run_command(user)
      flash[:success] = 'Daten erfolgreich geaendert'
      redirect_to action: :userpage
    else
      flash[:error] ='Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      render action: :edit
    end 
  end

  def delete
    user = DeleteUserCommand.new(id: params[:id])
    if id = Domain.run_command(user)
      session[:tmp_event_id] = id
      flash[:success] = 'User was successfully deleted.'
    else
      flash[:error] = 'User couldn\'t be deleted.'
    end
    redirect_to action: :index
  end
  
  def create
    @user = RegisterUserCommand.new user_params.merge(typ: 0)
    if @user.valid? && Domain.run_command(@user)
      flash[:success] = 'Sie haben sich erfolgreich registriert.'
      redirect_to action: :index
      
    else
      flash[:error] = 'Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      render action: :new
    end
  end
  
#Sonstige Methoden

  def login
    inlog = LogInCommand.new(benutzername: params[:user][:benutzername], passwort: params[:user][:passwort])
    if inlog.valid? && Domain.run_command(inlog)
      @id = User.where(benutzername: params[:user][:benutzername]).first.id
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
    @lastposts = LastPost.where("user_id=?", session[:user]).order(created_at: :desc)
    @subscriptions = current_user.subscriptions
    if current_user.admin?
      @admin_messages = AdminMessage.all
      @admin = true
    else
      @admin_messages = current_user.admin_messages
    end
  end
  
  def logout
    reset_session
    
    flash[:success] = 'Sie haben sich erfolgreich ausgeloggt!'
    redirect_to users_path
  end
  
  def ban
    ban = BanUserCommand.new(user_id: params[:id])
    Domain.run_command(ban)
    flash[:success] = "Der Nutzer mit der id #{params[:id]} wurde gesperrt!"
    redirect_to user_path(id: 1)
  end

  def unban
    unban = UnbanUserCommand.new(user_id: params[:id])
    Domain.run_command(unban)
    flash[:success] = "Der Nutzer mit der id #{params[:id]} wurde entsperrt!"
    redirect_to user_path(id: 1)
  end
  
  def verificated
    verificated = VerificatedUserCommand.new(user_id: params[:id])
    Domain.run_command(verificated)
    flash[:success] = "Der Nutzer mit der ID #{params[:id]} wurde erfolgreich verifiziert!"
    redirect_to users_path
  end

private
  def regmail

  end

  def validate_user
    puts "Userdata: #{params[:id]}"
    puts "Cu: #{current_user.id}"
    if current_user.id.to_s != params[:id]  && !current_user.admin? # && !(params[:userunlock] == URI.encode(Digest::MD5.hexdigest(@user.benutzername+Date.today.to_s+Time.now.strftime("%I").to_s)))
      redirect_to action: :index
      flash[:error] = 'Sie haben nicht die benoetigten Rechte, um diese Aktion durchzufuehren!' 
    end 
  end
  
  def user_params
    params.require(:user).permit(:vorname, :name, :email, :benutzername, :passwort)
  end
  
end
