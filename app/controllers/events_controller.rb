class EventsController < ApplicationController

  before_action :load_events, only: [:index, :create]
  before_action :load_users, only: [:index, :create, :edit]
  before_action :load_event, only: [:show, :edit, :destroy, :update]

  def index
    @event = Event.new
    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  def create
    event = Event.create(event_params)
    if event.save
      redirect_to events_path
    else
      @event = event;
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path }
      format.json { render json: {message: 'success'} }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :user_id, :description)
  end

  def load_events
    @events = Event.all
  end

  def load_event
    @event = Event.find(params[:id])
  end

  def load_users
    @users = User.all
  end
end
