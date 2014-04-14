
class AdminmessagesController < ApplicationController
  before_action :set_adminmessage, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]
  before_action :authenticate, except: [:index, :show]
  before_action :require_unbanned_amessage

  def index
    @adminmessages = Adminmessage.all
  
  end

  def show
  end

  def new
    @adminmessage = Adminmessage.new
  end

  def edit
  end

  def create
    adminmessage = CreateAdminmessageCommand.new({message: params[:adminmessage][:message], user_id: session[:user]})
    valid = adminmessage.valid?
    if valid and id = Domain.run_command(adminmessage)
      flash[:success] = 'Adminmessage was successfully created. Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      session[:banned_rate] = false if session[:banned_rate]
      redirect_to adminmessages_path
    else
      flash[:error] = 'Adminmessage couldn\'t be created. Please LOG IN and try again.'
      redirect_to new_adminmessage_path
    end
  end

  def update
    adminmessage = UpdateAdminmessageCommand.new({id: params[:id], message: params[:adminmessage][:message], user_id: session[:user]})
    valid = adminmessage.valid?
    if valid and id = Domain.run_command(adminmessage)
      flash[:success] = 'Adminmessage was successfully updated.  Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      redirect_to adminmessage_path(id: params[:id])
    else
      flash[:error] = 'Adminmessage couldn\'t be updated.'
      redirect_to edit_adminmessage_path(id: params[:id])
    end
  end

  def destroy
    adminmessage = DeleteAdminmessageCommand.new({id: params[:id]})
    if id = Domain.run_command(adminmessage)
      session[:tmp_event_id] = id
      flash[:success] = 'Adminmessage was successfully deleted.  Bitte Seite neu laden um Änderungen zu sehen.'
    else
      flash[:error] = 'Adminmessage couldn\'t be deleted.'
    end
    redirect_to adminmessages_path
  end

  private
  def set_adminmessage
    @adminmessage = Adminmessage.find(params[:id])
  end

  def set_event_id
    @event_id = session[:tmp_event_id]
    session[:tmp_event_id] = nil
  end

  def require_unbanned_amessage
    if current_user.banned?
      redirect_to banned_users_path unless session[:banned_rate]
    end
  end

end


