require 'action_mailer'
require_relative '../mailers/subscription_mailer'
class SubscribedpostProjection
  include ActiveProjection::ProjectionType
  
  def created_post_event(event,headers)
  	Subscription.where('topic_id = ?', event.topic_id).each do |sub|
  		sub.subscribedposts.first.destroy! if sub.subscribedposts.count == 5
  		eventvalues = event.values.slice(:title, :text, :benutzername, :gravatar_id, :created_at)
  		sub.subscribedposts.create! eventvalues.merge updated: false
      subpost = Subscribedpost.new eventvalues.merge updated:false
      #SubscriptionMailer.createmail(subpost,sub.user_id,sub.topic_name).deliver if sub.email && headers[:replayed]
  	end
  end

  def updated_post_event(event,headers)
  	Subscription.where('topic_id = ?', event.topic_id).each do |sub|
  		sub.subscribedposts.first.destroy! if sub.subscribedposts.count == 5
  		eventvalues = event.values.slice(:title, :text, :benutzername, :gravatar_id)
  		sub.subscribedposts.create! eventvalues.merge(updated: true, created_at: event.updated_at)
      subpost = Subscribedpost.new eventvalues.merge updated:true
      #SubscriptionMailer.updatemail(subpost,sub.user_id,sub.topic_name).deliver if sub.email && headers[:replayed]
  	end	
  end

end
