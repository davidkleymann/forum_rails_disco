class TopicsController < ApplicationController
  def destroy
  	topic = TopicDeleteCommand.new({id: params[:id]})
    if id = Domain.run_command(topic)
      session[:tmp_event_id] = id
      flash[:notice] = 'Topic wurde geloescht.'
    else
      flash[:error] = 'Topic konnte nicht geloescht werden.'
    end
  end

  def show
  end
end
