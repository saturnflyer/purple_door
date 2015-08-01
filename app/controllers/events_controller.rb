class EventsController < ApplicationController
  def calendar
  end

  def new
    @event = Event.new
  end

  def create
    datetime = Time.strptime(event_params[:datetime], "%m/%d/%Y")
    Event.create(user_id: 999, name: event_params[:name], datetime: datetime, user_id: 3)
    redirect_to root_path
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :datetime)
  end
end
