class RegistrationsController < ApplicationController

  def index
    event_id = params[:event_id]
    @event = Event.find(event_id)
    @registrations = @event.registrations
  end
end
