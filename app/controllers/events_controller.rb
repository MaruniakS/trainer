class EventsController < ApplicationController
  def index
    @events = Event.includes(:training_day).where(user: current_user)
  end

  def show

  end

  def new
    @event = Event.new
    @days = TrainingProgram.first.training_days
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to user_events_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  private
  def event_params
    params.require(:event).permit(:name, :training_day_id, :user_id, schedule_attributes: Schedulable::ScheduleSupport.param_names)
  end
end
