
class AdminmessagesController < ApplicationController
  before_action :set_adminmessage, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]

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
      flash[:notice] = 'Adminmessage was successfully created.'
      session[:tmp_event_id] = id
      redirect_to action: :index
    else
      flash[:error] = 'Adminmessage couldn\'t be created.'
      redirect_to action: :new
    end
  end

  def update
    adminmessage = UpdateAdminmessageCommand.new({id: params[:id], message: params[:adminmessage][:message], editor_id: session[:user]})
    valid = adminmessage.valid?
    if valid and id = Domain.run_command(adminmessage)
      flash[:notice] = 'Adminmessage was successfully updated.'
      session[:tmp_event_id] = id
      redirect_to action: :show, id: params[:id]
    else
      flash[:error] = 'Adminmessage couldn\'t be updated.'
      redirect_to action: :edit, id: params[:id]
    end
  end

  def destroy
    adminmessage = DeleteAdminmessageCommand.new({id: params[:id]})
    if id = Domain.run_command(adminmessage)
      session[:tmp_event_id] = id
      flash[:notice] = 'Adminmessage was successfully deleted.'
    else
      flash[:error] = 'Adminmessage couldn\'t be deleted.'
    end
    redirect_to action: :index
  end

  private
  def set_adminmessage
    @adminmessage = Adminmessage.find(params[:id])
  end

  def set_event_id
    @event_id = session[:tmp_event_id]
    session[:tmp_event_id] = nil
  end
end


