class UsersController < ApplicationController

  before_action :authenticate, only: [:userpage, :edit, :update, :show, :delete]
  before_action :require_admin, only: [:show, :delete, :ban]
  before_action :validate_user, only: [:edit, :update]

  def index
  end

  def show
    @users = User.all
  end

  def new
  	@user = User.new
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
      redirect_to action: :edit
    end 
  end

  def delete
    user = DeleteUserCommand.new({id: params[:id]})
    if id = Domain.run_command(user)
      session[:tmp_event_id] = id
      flash[:success] = 'User was successfully deleted.'
    else
      flash[:error] = 'User couldn\'t be deleted.'
    end
    redirect_to action: :index
  end
  
  def create
    user = RegisterUserCommand.new user_params.merge(typ: 0)
    if user.valid? && !user.errors[:benutzername].empty?
      Domain.run_command(user)
      flash[:success] = 'Sie haben sich erfolgreich registriert.'
      redirect_to action: :index
          UserMailer.registermail(User.all.where('benutzername = ?', user.benutzername).first).deliver
      verificate()
    else
      if !user.errors[:benutzername].empty?
        flash[:error] ='Fehler: Bitte ueberpruefen Sie ihre Eingaben!'
      else
        flash[:error] = 'Der Benutzername ist schon vergeben oder die Eingabe des Benutzernamens war fehlerhaft!'
      end
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
    redirect_to user_path(id: 1)
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