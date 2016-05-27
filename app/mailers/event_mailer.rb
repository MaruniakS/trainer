require 'mail'
class EventMailer < ApplicationMailer
  default from: 'trainer.sup@gmail.com'

  def send_remind_email(name, time, email)
    address = Mail::Address.new email
    address.display_name = 'Personal Fitness Trainer'
    @name, @time = name, time
    mail(to: email, subject: 'Нагадування')
  end
end
