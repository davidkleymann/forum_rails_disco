class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]
  before_action :post_params, only [:show, :update, :create]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new(topic_id: params[:topic_id])
  end

  def edit
  end

  def create
    post = PostCreateCommand.new(post_params.merge(topic_id: params[:topic_id]))
    valid = post.valid?
    if valid && id = Domain.run_command(post)
      flash[:notice] = 'Post wurde erstellt.'
      session[:tmp_event_id] = id
      redirect_to action: :index
    else
      flash[:error] = 'Post konnte nicht erstellt werden.'
      redirect_to action: :new
    end
  end

  def update
    post = PostUpdateCommand.new(post_params.merge(id: params[:id]))
    valid = post.valid?
    if valid && id = Domain.run_command(post)
      flash[:notice] = 'Post wurde geupdated.'
      session[:tmp_event_id] = id
      redirect_to action: :show, id: params[:id]
    else
      flash[:error] = 'Post konnte nicht geupdated werden.'
      redirect_to action: :edit, id: params[:id]
    end
  end

  def destroy
    post = PostDeleteCommand.new({id: params[:id]})
    if id = Domain.run_command(post)
      session[:tmp_event_id] = id
      flash[:notice] = 'Post wurde geloescht.'
    else
      flash[:error] = 'Post konnte nicht geloescht werden.'
    end
    redirect_to action: :index
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_event_id
    @event_id = session[:tmp_event_id]
    session[:tmp_event_id] = nil
  end

  def post_params
    params.require(:post).permit(:title, :text, :user_id, :time)
  end
end