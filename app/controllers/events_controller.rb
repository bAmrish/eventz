class EventsController < ApplicationController

  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    filter = params[:filter]
    case filter
    when "past"
      @events = Event.past
    when "free"
      @events = Event.free
    when "recent"
      @events = Event.recent
    else
      @events = Event.upcoming
    end
  end

  def show
    @likers = @event.likers
    @categories = @event.categories
    
    if is_logged_in?
      @like = current_user.likes.find_by(event: @event)
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = 'Event updated successfully!'
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: "Event created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @event.destroy
    redirect_to events_url, status: :see_other
  end

private
  def event_params
    params.require(:event)
      .permit(
        :name, :description, :location, :price, 
        :starts_at, :capacity, 
        category_ids: []
      )
  end

  def set_event
    @event = Event.find_by!(slug: params[:id])
  end
end
