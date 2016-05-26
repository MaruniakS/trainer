class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :training_day
  acts_as_schedulable :schedule

  def start_time
    self.schedule ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
