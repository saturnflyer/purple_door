class EventsController < ApplicationController
  def index
    @event = Event.new
  end

  def new
    
  end

  def create
    #datetime = Time.strptime(event_params[:datetime], "%m/%d/%Y")
    #Event.create(user_id: 999, name: event_params[:name], datetime: datetime, user_id: 3)
    #redirect_to root_path
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :start)
  end
end
