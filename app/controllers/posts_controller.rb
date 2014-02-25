class PostsController < ApplicationController
  before_action :set_post, only: [:edit]
  before_action :post_params, only: [:update, :create]
  before_action :authenticate, only: [:create, :update, :delete]

  def new
    @topic = Topic.find(params[:topic_id])
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
      redirect_to topic_path(id: post_params[:topic_id])
    else
      flash[:error] = 'Post konnte nicht erstellt werden.'
      redirect_to action: :new
    end
  end

  def update
    post = UpdatePostCommand.new(post_params.merge(id: params[:id], user_id: session[:user]))
    valid = post.valid?
    if valid && id = Domain.run_command(post)
      flash[:notice] = 'Post wurde geupdated. Bitte Seite neu laden um Änderungen zu sehen.'
      session[:tmp_event_id] = id
      redirect_to topic_path(id: post.topic_id)
    else
      flash[:error] = 'Post konnte nicht geupdated werden.'
      redirect_to action: :edit, id: params[:id]
    end
  end

  def destroy
    temp = Post.find(params[:id]).topic_id
    post = DeletePostCommand.new({id: params[:id]})
    if id = Domain.run_command(post)
      session[:tmp_event_id] = id
      flash[:notice] = 'Post wurde geloescht.  Bitte Seite neu laden um Änderungen zu sehen.'
    else
      flash[:error] = 'Post konnte nicht geloescht werden.'
    end
    redirect_to topic_path(id: temp)
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
end