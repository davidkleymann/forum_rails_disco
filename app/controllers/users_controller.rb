class UsersController < ApplicationController
  include EventSource
  before_action :authenticate, only: [:userpage, :edit, :update, :show, :delete]
  before_action :require_admin, only: [:show, :delete, :ban]
  before_action :validate_user, only: [:edit, :update]

  def index
    @user = LogInCommand.new
  end

  def show
    @users = User.all
  end

  def new
  	@user = RegisterUserCommand.new
  end

  def edit
    @user = UpdateUserCommand.new User.find(id_param).updatable_attributes
  end

  def create
    @user = RegisterUserCommand.new user_params.merge(typ: 0, shash: SecureRandom.hex(10))
    if store_event_id Domain.run_command(@user)
      UserMailer.registermail(@user).deliver
      redirect_to({action: :index}, notice: 'Sie haben sich erfolgreich registriert.')
    
    else
      render 'new'
    end
  end

  def update
    @user = UpdateUserCommand.new user_params.merge(id: id_param)
    if store_event_id Domain.run_command(@user)
      redirect_to({action: :userpage}, notice: 'Daten erfolgreich geaendert')
    else
      render 'edit'
    end
  end

  def delete
    delete_user = DeleteUserCommand.new id: id_param
    if store_event_id Domain.run_command(delete_user)
      redirect_to({action: :index}, notice: 'Account erfolgreich gelöscht.')
    else
      redirect_to({action: :index}, alert: 'Account konnte nicht gelöscht werden.')
    end
  end

  #Sonstige Methoden

  def login
    login = LogInCommand.new login_params
    if store_event_id Domain.run_command(login)
      session[:user] = User.where(benutzername: login.benutzername).first.id
      if params[:merk].nil? || params[:merk] == users_path
        redirect_to userpage_user_path(id: session[:user])
      else
        redirect_to params[:merk]
      end
    else
      flash[:error] = 'Fehler: Falscher Benutzername und/oder falsches Passwort!'
      redirect_to users_path(merk: params[:merk])
    end
  end

  def userpage
  end
  
  def logout
    reset_session
    
    flash[:success] = 'Sie haben sich erfolgreich ausgeloggt!'
    redirect_to users_path
  end
  
  def ban
    ban = BanUserCommand.new(user_id: id_param)
    store_event_id Domain.run_command(ban)
    redirect_to user_path(id: 1), notice: "Der Nutzer mit der id #{id_param} wurde gesperrt!"
  end

  def unban
    unban = UnbanUserCommand.new(user_id: id_param)
    store_event_id Domain.run_command(unban)
    redirect_to user_path(id: 1), notice: "Der Nutzer mit der id #{id_param} wurde entsperrt!"
  end
  
  def verificated
    verificated = VerificatedUserCommand.new(user_id: id_param)
    store_event_id Domain.run_command(verificated)
    redirect_to users_path, notice: "Der Nutzer mit der ID #{id_param} wurde erfolgreich verifiziert!"
  end

private
  def regmail

  end

  def validate_user
    if current_user.id != id_param && !current_user.admin? # && !(params[:userunlock] == URI.encode(Digest::MD5.hexdigest(@user.benutzername+Date.today.to_s+Time.now.strftime("%I").to_s)))
      redirect_to({action: :index}, notice: 'Sie haben nicht die benötigten Rechte, um diese Aktion durchzuführen!')
    end 
  end
  
  def user_params
    params.require(:user).permit(:vorname, :name, :email, :benutzername, :passwort)
  end

  def login_params
    params.require(:user).permit(:benutzername, :passwort)
  end

  def id_param
    params.require(:id).to_i
  end
end
