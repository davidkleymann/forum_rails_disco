
class AdminMessagesController < ApplicationController
  include EventSource

  before_action :authenticate, except: [:index, :show]
  before_action :require_unbanned_message

  def index
    @admin_messages = AdminMessage.all
  end

  def show
    @admin_message = AdminMessage.find(id_param)
  end

  def new
    @admin_message = CreateAdminMessageCommand.new
  end

  def edit
    @admin_message = UpdateAdminMessageCommand.new AdminMessage.find(id_param).updatable_attributes
  end

  def create
    @admin_message = CreateAdminMessageCommand.new(admin_message_params.merge!(user_id: current_user.id))
    if store_event_id Domain.run_command(@admin_message)
      redirect_to admin_messages_path, notice: 'Admin Nachricht erfolgreich angelegt.'
    else
      render 'new'
    end
  end

  def update
    @admin_message = UpdateAdminMessageCommand.new(admin_message_params.merge!(id: id_param, user_id: current_user.id))
    if store_event_id Domain.run_command(@admin_message)
      redirect_to @admin_message, notice: 'Admin Nachricht erfolgreich geändert.'
    else
      render 'edit'
    end
  end

  def destroy
    delete_admin_message = DeleteAdminMessageCommand.new(id: id_param)
    if store_event_id Domain.run_command(delete_admin_message)
      redirect_to admin_messages_path, notice: 'Admin Nachricht erfolgeich gelöscht.'
    else
      redirect_to admin_messages_path, alert: 'Admin Nachricht konnte nicht gelöscht werden!'
    end
  end

  private

  def admin_message_params
    params.require(:admin_message).permit(:message)
  end

  def id_param
    params.require(:id).to_i
  end

  def require_unbanned_message
    if current_user.banned?
      redirect_to banned_users_path unless current_user.rate == 1
    end
  end 
end


