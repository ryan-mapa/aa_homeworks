class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/session/new'
    mail(to: user.username, subject: 'Click for free cats!')
  end

  def create
    u = User.create(user_params)
    msg = UserMailer.welcome_email(u)
    msg.deliver_now
    render :root
  end



end
