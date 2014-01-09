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
  	@topics = Topic.all
  end

    def create
    topic = TopicCreateCommand.new()
    valid = topic.valid?
    if valid && id = Domain.run_command(topic)
      flash[:notice] = 'Topic wurde erstellt.'
      session[:tmp_event_id] = id
      redirect_to action: :show
    else
      flash[:error] = 'Topic konnte nicht erstellt werden.'
      redirect_to action: :new
    end

private

def params
params.require(:topic).permit(:thema, :startedby)
  end
end  

end
