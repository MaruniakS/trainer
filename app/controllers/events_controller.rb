class EventsController < ApplicationController
  def index
    @event = Event.new
    @events = current_user.events
  end
end
