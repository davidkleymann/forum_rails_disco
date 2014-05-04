class TopicsController < ApplicationController
  include EventSource
  before_action :set_thema, only: [:new, :create]
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_unbanned
  before_action :validate_user, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(id_param)
  end

  def new
    @topic = CreateTopicCommand.new
  end

  def create
    @topic = CreateTopicCommand.new(topic_params.merge(thema_id: @thema.id, user_id: current_user.id))
    if store_event_id Domain.run_command(@topic)
      redirect_to @topic, notice: 'Diskussion wurde erfolreich erstellt.'
    else
      render 'new'
    end
  end

  def edit
    @topic = UpdateTopicCommand.new Topic.find(id_param).updatable_attributes
  end
  
  def update
    @topic = UpdateTopicCommand.new topic_params.merge(id: id_param, user_id: current_user.id)
    if store_event_id Domain.run_command(@topic)
      redirect_to @topic, notice: 'Diskussion wurde geändert.'
    else
      render 'edit'
    end
  end

  def destroy
    delete_topic = DeleteTopicCommand.new id: id_param
    if store_event_id Domain.run_command(delete_topic)
      redirect_to themas_path, notice: 'Diskussion wurde gelöscht.'
    else
      redirect_to themas_path, alert: 'Diskussion konnte nicht gelöscht werden.'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def id_param
    params.require(:id).to_i
  end

  def set_thema
    @thema = Thema.find(params[:thema_id])
  end

  def validate_user
    unless Topic.find(id_param).user_id == id_param || current_user.admin?
      flash[:error] = 'Sie haben nicht die benoetigten Rechte um diese Aktion durchzufuehren!'
      redirect_to themas_path(id: params[:thema_id])
    end
  end
end
