class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_unbanned
  before_action :validate_user, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @thema = Thema.find(params[:thema_id])
    @topic = CreateTopicCommand.new
  end

  def create
    @topic = CreateTopicCommand.new(topic_params.merge(thema_id: params[:thema_id], user_id: session[:user]))
    valid = @topic.valid?
    if valid and id = Domain.run_command(@topic)
      flash[:success] = 'Topic was successfully created.'
      session[:tmp_event_id] = id
      redirect_to controller: :posts, action: :create #, id: params[:thema_id]
    else
      flash[:error] = 'Topic couldn\'t be created.'
      @thema = Thema.find(params[:thema_id])
      render action: :new
    end
  end

  def edit
    attributes = Topic.find(params[:id]).attributes
    @topic = UpdateTopicCommand.new(attributes.merge(topic_params, id: params[:id], user_id: session[:user]))
  end
  
  def update
    topic = UpdateTopicCommand.new(topic_params.merge(id: params[:id], user_id: session[:user]))
    valid = topic.valid?
    if valid and id = Domain.run_command(topic)
      flash[:success] = 'Topic was successfully updated. Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      redirect_to action: :show, id: params[:id]
    else
      flash[:error] = 'Topic couldn\'t be updated.'
      redirect_to action: :edit, id: params[:id]
    end
  end

  def destroy
    topic = DeleteTopicCommand.new({id: params[:id]})
    if id = Domain.run_command(topic)
      session[:tmp_event_id] = id
      flash[:success] = 'Topic was successfully deleted. Bitte Seite neu laden um Änderungen zu sehen.'
    else
      flash[:error] = 'Topic couldn\'t be deleted.'
    end
    redirect_to themas_path
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
  
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_event_id
    @event_id = session[:tmp_event_id]
    session[:tmp_event_id] = nil
  end

  def validate_user
    unless Topic.find(params[:id]).user_id == params[:id] || current_user.admin?
      flash[:error] = 'Sie haben nicht die benoetigten Rechte um diese Aktion durchzufuehren!'
      redirect_to themas_path(id: params[:thema_id])
    end
  end

end

