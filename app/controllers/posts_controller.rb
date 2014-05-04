class PostsController < ApplicationController
  include EventSource
  before_action :authenticate, only: [:create, :new, :edit, :update, :destroy]

  def new
    @topic = Topic.find(params[:topic_id])
    @post = CreatePostCommand.new(topic_id: @topic.id)
  end

  def edit
    @post = UpdatePostCommand.new(Post.find(id_param).updatable_attributes)
  end

  def create
    @post = CreatePostCommand.new(post_params.merge(user_id: session[:user]))
    if store_event_id Domain.run_command(@post)
      redirect_to topic_path(id: @post.topic_id), notice: 'Post wurde erstellt.'
    else
      render 'new'
    end
  end

  def update
    @post = UpdatePostCommand.new(post_params.merge(id: id_param, user_id: session[:user]))
    if store_event_id Domain.run_command(@post)
      redirect_to topic_path(id: @post.topic_id), notice: 'Post wurde geändert.'
    else
      render 'edit'
    end
  end

  def destroy
    topic_id = Post.find(id_param).topic_id
    post = DeletePostCommand.new(id: id_param)
    if store_event_id Domain.run_command(post)
      redirect_to topic_path(id: topic_id), notice: 'Post wurde geloescht.'
    else
      redirect_to topic_path(id: topic_id), alert: 'Post konnte nicht geloescht werden!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :topic_id)
  end

  def id_param
    params.require(:id).to_i
  end
end
