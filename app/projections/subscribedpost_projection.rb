class SubscribedpostProjection
  include ActiveProjection::ProjectionType
  
  def created_post_event(event)
  	Subscription.where('topic_id = ?', event.topic_id).each do |sub|
  		sub.subscribedposts.last.destroy! if sub.subscribedposts.count = 5
  		eventvalues = event.values.slice(:title, :text, :benutzername, :gravatar_id, :created_at)
  		sub.subscribedposts.create! eventvalues(event, sub).merge updated: false
  	end
  end

  def updated_post_event(event)
  	Subscription.where('topic_id = ?', event.topic_id).each do |sub|
  		sub.subscribedposts.last.destroy! if sub.subscribedposts.count = 5
  		eventvalues = event.values.slice(:title, :text, :benutzername, :gravatar_id)
  		sub.subscribedposts.create! eventvalues.merge(updated :true, created_at: event.updated_at)
  	end	
  end

end
