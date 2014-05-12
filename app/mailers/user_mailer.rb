class UserMailer < ActionMailer::Base
  default from: "discoforum@develop.hicknhack.com"

  def registermail(user)
    @user = user
    @host = 'localhost:3000'
    mail(to: @user.email, subject: 'Registrierung bei unserem Disco-Forum')
  end

  def banmail(user)

  end

end
