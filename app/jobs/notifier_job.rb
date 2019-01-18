class NotifierJob < ApplicationJob
  queue_as :mailers

  def perform(user1,user2)
    # Do something later
    UserMailer.notify_email(user1,user2).deliver_now
  end
end
