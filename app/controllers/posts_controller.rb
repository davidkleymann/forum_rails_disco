class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  before_action :set_event_id, only: [:index, :show]
  before_action :post_params, only: [:update, :create]
  before_action :authenticate, only: [:create, :update, :delete]
  before_action :set_ids, except: [:index]


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
    post = CreatePostCommand.new(post_params.merge(time: Time.now, user_id: session[:user]))
    valid = post.valid?
    if valid && id = Domain.run_command(post)
      flash[:notice] = 'Post wurde erstellt. Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      redirect_to thema_topic_path(thema_id: params[:thema_id], id: post_params[:topic_id])
    else
      flash[:error] = 'Post konnte nicht erstellt werden.'
      redirect_to action: :new
    end
  end

  def update
    post = UpdatePostCommand.new(post_params.merge(id: params[:id], editor_id: session[:user]))
    valid = post.valid?
    if valid && id = Domain.run_command(post)
      flash[:notice] = 'Post wurde geupdated. Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      redirect_to thema_topic_post_path(thema_id: params[:thema_id],topic_id: post.topic_id, id: post.id)
    else
      flash[:error] = 'Post konnte nicht geupdated werden.'
      redirect_to action: :edit, id: params[:id]
    end
  end

  def destroy
    post = DeletePostCommand.new({id: params[:id]})
    if id = Domain.run_command(post)
      session[:tmp_event_id] = id
      flash[:notice] = 'Post wurde geloescht.  Bitte Seite neu laden um Änderungen zu sehen.'
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
    params.require(:post).permit(:title, :text, :topic_id)
  end

  def authenticate
    temp = session[:user]
    if temp.nil?
      redirect_to users_path(merk: request.original_url)
      flash[:error] = 'Fehler: bitte einloggen oder registrieren'
    end
  end

  def set_ids
    @ids = {thema_id: params[:thema_id], topic_id: params[:topic_id]}
  end
end