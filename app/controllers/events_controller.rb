class EventsController < ApplicationController

  before_action :set_user
  before_action :set_place

  def index
    @events = Event.all

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.place = @place
    @event.user = @user
    if @event.save
      redirect_to profile_path
    else
      render :new
    end

    def destroy
      @event.delete
      rediret_to profile_path
    end

    private

    def set_place
    @place = Place.find(params[:place_id])

    def set_user
      if user_signed_in?
        @user = current_user
      end
    end

    def event_params
      params.require(:event).permit(:type, :start_time, :place_id)
    end
end
