class subscription_mailer < ActionMailer::Base
	default from: "discoforum@develop.hicknhack.com"

	def createmail(subscribedpost,user_id,topic_name)
		@subscribedpost = subscribedpost
		@user = User.find(user_id)
		@topic_name = topic_name
		subject = "#{@user.benutzername} hat einen neuen Post in der Diskussion #{@topic_name} verfasst!"
		mail(to: @user.email, subject: subject)
	end

	def updatemail(subscribedpost,user_id,topic_name)
		@subscribedpost = subscribedpost
		@user = User.find(user_id)
		@topic_name = topic_name
		subject = "#{@user.benutzername} hat seinen Post #{@subscribedpost.title} in der Diskussion #{@topic_name} bearbeitet!"
		mail(to: @user.email, subject: subject)
	end

end