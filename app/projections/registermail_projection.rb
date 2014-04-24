require 'action_mailer'
require_relative '../mailers/user_mailer'
class RegistermailProjection
  include ActiveProjection::ProjectionType
  

  
  def created_user_event(event,headers)
    if headers[:replayed]
    #  UserMailer.registermail(User.all.where('benutzername = ?', @user.benutzername).first).deliver
    end
  end
  
end
