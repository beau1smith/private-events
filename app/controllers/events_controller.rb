class EventsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        flash[:success] = "Event created"
        format.html { redirect_to events_path, notice: "event was created successfully" }
      else
        format.html { render :new, status: :unprocessable_entity }
        @status = params
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(params.require(:event).permit(:title, :name, :start_time, :end_time))
        format.html { redirect_to events_url(@event), notice: "Event was updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    respond_to do |format|
      format.html { redirect_to events_path, notice: "Event was successfully destroyed"}
    end
  end

  def rsvp
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to @event, notice: "You are already on the list"
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end

  def cancel_rsvp
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: "You are no longer attending this event"
  end
private

  def event_params
    params.require(:event).permit(:id, :title, :start_time, :end_time, :user_id)
  end
end