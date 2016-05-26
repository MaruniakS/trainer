class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :training_day
  acts_as_schedulable :schedule

  def start_time
    self.schedule.occurrences(2.month.ago + 2.month)
    ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
