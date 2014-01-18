
class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    topic = CreateTopicCommand.new({title: params[:topic][:title], user_id: params[:topic][:user_id]})
    valid = topic.valid?
    if valid and id = Domain.run_command(topic)
      flash[:notice] = 'Topic was successfully created.'
      session[:tmp_event_id] = id
      redirect_to action: :index
    else
      flash[:error] = 'Topic couldn\'t be created.'
      redirect_to action: :new
    end
  end

  def update
    topic = UpdateTopicCommand.new({id: params[:id], title: params[:topic][:title], user_id: params[:topic][:user_id]})
    valid = topic.valid?
    if valid and id = Domain.run_command(topic)
      flash[:notice] = 'Topic was successfully updated.'
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
      flash[:notice] = 'Topic was successfully deleted.'
    else
      flash[:error] = 'Topic couldn\'t be deleted.'
    end
    redirect_to action: :index
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_event_id
    @event_id = session[:tmp_event_id]
    session[:tmp_event_id] = nil
  end
end

