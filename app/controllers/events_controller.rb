class EventsController < ApplicationController
  def new
    @title = "New Event"
    @event = Event.new
  end

  def create
    @event= current_user.events.build(params[:id])
    if  @event.save
      redirect_to events, :flash[:success] => "Event created succesfully"

    else
      redirect_to 'new'
    end
  end

  def show
  end

  def destroy
  end

  def index
    @title ="Events"
    @events = current_user.events
  end

  def edit
  end
end
