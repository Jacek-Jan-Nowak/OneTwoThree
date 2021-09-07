class EventsController < ApplicationController

  before_action :set_user

  def index
    @events = Event.all
    if params[:query].present?
      #@event_ids = Place.near(params[:query], params[:radius]).collect{|a| a.event_ids}.uniq
      #@events = Event.where('id in (?)', @event_ids)
      #place = Place.near(params[:query], params[:radius])
      #@events = Event.joins(:place).merge(place)
    else
      @events = Event.all
      if params[:user].present?
        @invitee = params[:user]
      end
    end
    @markers = @events.map do |event|
      {
        lat: event.place.latitude,
        lng: event.place.longitude,
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = params[:user]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    @event.delete
    rediret_to profile_path
  end

  private

  def set_user
    if user_signed_in?
      @current_user = current_user
    end
  end

  def event_params
    params.require(:event).permit(:event_type, :start_time, :place_id, :host_id, dancer_id: [])
  end
end
