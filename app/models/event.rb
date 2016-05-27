class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :training_day
end
