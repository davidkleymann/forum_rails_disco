
class LastpostProjection
  include ActiveProjection::ProjectionType
  	
  	def post_create_event(event)
  	  find
  	  Lastpost.create! event.values.merge(event.id)
  	end

  private

    def find
  	  @lastpost = Lastpost.where("user=?",event.values[:user]).order(time: :desc)
  	  if @lastpost.length == 10
  	  	id = @lastpost[10].id
  	  	Lastpost.find(id).destroy!
  	  end
    end
  
end

