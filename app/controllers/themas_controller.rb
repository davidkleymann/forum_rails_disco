
class ThemasController < ApplicationController
  include EventSource
  before_action :authenticate, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @themas = Thema.hauptindex
  end

  def show
    @thema = Thema.find(id_param)
  end

  def new
    @thema = CreateThemaCommand.new(belong: params[:belong])
  end

  def edit
    @thema = UpdateThemaCommand.new Thema.find(id_param).updatable_attributes
  end

  def create
    @thema = CreateThemaCommand.new thema_params
    if store_event_id Domain.run_command(@thema)
      redirect_to @thema, notice: 'Thema wurde erstellt.'
    else
      render 'new'
    end
  end

  def update
    @thema = UpdateThemaCommand.new thema_params.merge(id: id_param)
    if store_event_id Domain.run_command(@thema)
      redirect_to @thema, notice: 'Thema wurde aktualisiert.'
    else
      render 'edit'
    end
  end

  def destroy
    delete_thema = DeleteThemaCommand.new id: id_param
    if store_event_id Domain.run_command(delete_thema)
      redirect_to({action: :index}, notice: 'Thema wurde gelöscht.')
    else
      redirect_to thema_url(id: id_param), alert: 'Thema konnte nicht gelöscht werden!'
    end
  end

  private

  def thema_params
    params.require(:thema).permit(:title,:description,:belong)
  end

  def id_param
    params.require(:id).to_i
  end
end
