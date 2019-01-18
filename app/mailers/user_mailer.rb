class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notify_email(user1,user2)
    @user1 = user1
    @user2 = user2
    mail(to: @user1.email, subject: "#{@user2.name} has commented on your post")
  end
end
