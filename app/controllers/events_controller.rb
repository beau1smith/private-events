class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:success] = "Event created"
        format.html { redirect_to root_path, notice: "event was created successfully" }
      else
        format.html { render :new, status: :unprocessable_entity }
        @status = params
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:id, :title, :start_time, :end_time)
  end
end