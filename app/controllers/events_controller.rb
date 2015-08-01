class EventsController < ApplicationController

  before_action :load_events, only: [:index, :create]
  before_action :load_users, only: [:index, :create]

  def index
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    render :index
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :user_id)
  end

  def load_events
    @events = Event.all
  end

  def load_users
    @users = User.all
  end
end
