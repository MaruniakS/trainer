class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = current_user.events
    @days = current_user.training_days
  end

  private
  def event_params
    params.require(:event).permit(:name, :day, :time, :email, :sms, :training_day_id, :user_id)
  end
end
