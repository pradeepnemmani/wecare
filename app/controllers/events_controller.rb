class EventsController < ApplicationController
  def new
    @title = "New Event"
    @event = Event.new
  end

  def create
    @event = current_user.events.build(params[:event])

    if  @event.save
      redirect_to events_path, :flash => {:sucsess => "Topic added successfully!"}

    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])

  end

  def destroy
    @event = Event.destroy(params[:id])
    redirect_to events_path,:flash => {:sucsess => "Topic deleted successfully!"}
  end

  def index
    @title ="Events"
    @events = current_user.events
  end

  def edit
    @title = " Update event"
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
   if @event.update_attributes(params[:event])
    redirect_to events_path, :flash => {:success => " Event updated!"}
   else
    render 'edit'
     end
  end
end
