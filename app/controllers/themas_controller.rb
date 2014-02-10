
class ThemasController < ApplicationController
  before_action :set_thema, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]
  before_action :authenticate, except: [:index, :show]

  def index
    @themas = Thema.where(belong: nil).order(:lastact)
  end

  def show
    @themas = Thema.where("belong = ?", @thema.id)
  end

  def new
    @thema = Thema.new
    @themas = Thema.all
  end

  def edit
    @themas = Thema.all
  end

  def create
    thema = CreateThemaCommand.new thema_params.merge(lastact: 0)
    valid = thema.valid?
    if valid and id = Domain.run_command(thema)
      flash[:notice] = 'Thema was successfully created.'
      session[:tmp_event_id] = id
      redirect_to action: :index
    else
      flash[:error] = 'Thema couldn\'t be created.'
      redirect_to action: :new
    end
  end

  def update
    thema = UpdateThemaCommand.new thema_params.merge(lastact: params[:lastact])
    valid = thema.valid?
    if valid and id = Domain.run_command(thema)
      flash[:notice] = 'Thema was successfully updated.'
      session[:tmp_event_id] = id
      redirect_to action: :show, id: params[:id]
    else
      flash[:error] = 'Thema couldn\'t be updated.'
      redirect_to action: :edit, id: params[:id]
    end
  end

  def destroy
    thema = DeleteThemaCommand.new(id: params[:id])
    if id = Domain.run_command(thema)
      session[:tmp_event_id] = id
      flash[:notice] = 'Thema was successfully deleted.'
    else
      flash[:error] = 'Thema couldn\'t be deleted.'
    end
    redirect_to action: :index
  end

  private
  def set_thema
    @thema = Thema.find(params[:id])
  end

  def set_event_id
    @event_id = session[:tmp_event_id]
    session[:tmp_event_id] = nil
  end

  def thema_params
    params.require(:thema).permit(:title,:description,:belong)
  end

  def authenticate
    auth = AuthenticateCommand.new(id: session[:user])
    unless Domain.run_command(auth)
      flash[:error] = 'Sie haben nicht die benoetigten Rechte um diese Aktion durchzufuehren!'
      redirect_to action: :index
    end
  end
end

