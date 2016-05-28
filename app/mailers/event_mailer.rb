require 'mail'
class EventMailer < ApplicationMailer
  default from: 'trainer.sup@gmail.com'

  def send_remind_email(event)
    address = Mail::Address.new 'trainer.sup@gmail.com'
    address.display_name = 'Personal Fitness Trainer'
    @event = event
    mail(to: event.user.email, subject: 'Нагадування')
  end
end
