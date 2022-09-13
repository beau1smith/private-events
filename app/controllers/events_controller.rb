class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

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
    @event = Event.find_by(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    respond_to do |format|
      if @event.update(params.require(:event).permit(:title, :name, :start_time, :end_time))
        format.html { redirect_to events_url(@event), notice: "Event was updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    
    respond_to do |format|
      format.html { redirect_to events_path, notice: "Event was successfully destroyed"}
    end
  end

private

  def event_params
    params.require(:event).permit(:id, :title, :start_time, :end_time)
  end
end