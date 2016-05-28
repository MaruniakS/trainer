class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :training_day
  def sent?
    self.sent
  end

  def correct_time
    self.time.strftime('%H:%M').to_time
  end

  def email?
    self.email
  end

  def sms?
    self.sms
  end

  DAYNAMES = %w(Неділя Понеділок Вівторок Середа Четвер П’ятниця Субота)
end
