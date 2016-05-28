class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :training_day
  def sent?
    self.sent
  end

  DAYNAMES = %w(Понеділок Вівторок Середа Четвер П’ятниця Субота Неділя)
end
