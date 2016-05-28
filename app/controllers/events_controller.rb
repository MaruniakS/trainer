class EventsController < ApplicationController
  before_action  :authenticate_user!
  def index
    @event = Event.new
    @events = current_user.events
    @days = current_user.training_days
  end

  def create
    @event = current_user.events.create(event_params)
    @event.sent = false
    @event.save
    @events = Event.includes(:training_day).where(user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id], user_id: params[:user_id])
    @event.destroy unless @event.nil?
    @events = Event.includes(:training_day).where(user: current_user)
    respond_to do |format|
      format.js
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :day, :time, :email, :sms, :training_day_id, :user_id)
  end
end
