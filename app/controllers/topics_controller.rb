
class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]
  before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  #before_action :validate_user, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @thema = Thema.find(params[:thema_id])
    @topic = Topic.new
  end

  def edit
  end
  
  def create
    topic = CreateTopicCommand.new(topic_params.merge(thema_id: params[:thema_id], user_id: session[:user]))
    valid = topic.valid?
    if valid and id = Domain.run_command(topic)
      flash[:notice] = 'Topic was successfully created. Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      redirect_to controller: :themas, action: :show, id: params[:thema_id]
    else
      flash[:error] = 'Topic couldn\'t be created.'
      redirect_to action: :new, thema_id: topic.thema_id
    end
  end

  def update
    topic = UpdateTopicCommand.new(topic_params.merge(id: params[:id], user_id: session[:user]))
    valid = topic.valid?
    if valid and id = Domain.run_command(topic)
      flash[:notice] = 'Topic was successfully updated. Bitte Seite neu laden um Änderungen zu sehen.'
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
      flash[:notice] = 'Topic was successfully deleted. Bitte Seite neu laden um Änderungen zu sehen.'
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
end

