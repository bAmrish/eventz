class EventsController < ApplicationController
  def index
    @events = ["Bug Smash", "Hackathon", "Rails Conference"]
  end
end
