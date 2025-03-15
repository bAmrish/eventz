class RegistrationsController < ApplicationController
  before_action :set_event
  before_action :require_signin, except: [:index]

  def index
    @registrations = @event.registrations
  end

  def new
    @registration = @event.registrations.new
    @registration.user = current_user
  end

  def create

    @registration = @event.registrations.new(registration_params)
    @registration.user = current_user

    if @registration.save
      redirect_to event_registrations_url(@event), notice: 'Thanks for registration!'
    else
      render :new, status: :unprocessable_entity
    end
  end

private
  def registration_params
    params.require(:registration)
      .permit(:how_heard)
  end

  def set_event
    event_id = params[:event_id]
    @event = Event.find(event_id)
  end
end
