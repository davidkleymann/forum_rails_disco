
class AdminMessagesController < ApplicationController
  before_action :set_admin_message, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]
  before_action :authenticate, except: [:index, :show]
  before_action :require_unbanned_message

  def index
    @admin_messages = AdminMessage.all
  
  end

  def show
  end

  def new
    @admin_message = CreateAdminMessage.new
  end

  def edit
  end

  def create
    admin_message = CreateAdminMessageCommand.new({message: params[:admin_message][:message], user_id: session[:user]})
    valid = admin_message.valid?
    if valid and id = Domain.run_command(admin_message)
      flash[:success] = 'Adminmessage was successfully created. Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      session[:banned_rate] = false if session[:banned_rate]
      redirect_to admin_messages_path
    else
      flash[:error] = 'Adminmessage couldn\'t be created. Please LOG IN and try again.'
      redirect_to new_admin_message_path
    end
  end

  def update
    admin_message = UpdateAdminMessageCommand.new({id: params[:id], message: params[:admin_message][:message], user_id: session[:user]})
    valid = admin_message.valid?
    if valid and id = Domain.run_command(admin_message)
      flash[:success] = 'Adminmessage was successfully updated.  Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      redirect_to admin_message_path(id: params[:id])
    else
      flash[:error] = 'Adminmessage couldn\'t be updated.'
      redirect_to edit_admin_message_path(id: params[:id])
    end
  end

  def destroy
    admin_message = DeleteAdminMessageCommand.new({id: params[:id]})
    if id = Domain.run_command(admin_message)
      session[:tmp_event_id] = id
      flash[:success] = 'Adminmessage was successfully deleted.  Bitte Seite neu laden um Änderungen zu sehen.'
    else
      flash[:error] = 'Adminmessage couldn\'t be deleted.'
    end
    redirect_to admin_messages_path
  end

  private
  def set_admin_message
    @admin_message = AdminMessage.find(params[:id])
  end

  def set_event_id
    @event_id = session[:tmp_event_id]
    session[:tmp_event_id] = nil
  end

  def require_unbanned_message
    if current_user.banned?
      redirect_to banned_users_path unless session[:banned_rate]
    end
  end

end


