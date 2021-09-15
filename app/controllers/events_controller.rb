class EventsController < ApplicationController

  before_action :set_user

  def index
    if params[:query].present?
      @events = Event.search_by_name_and_address(params[:query])
    else
      @events = Event.where.not(latitude: nil, longitude: nil)
      if params[:user].present?
        @invitee = params[:user]
      end
    end
    
    @markers = @events.map do |event|
    {
      lat: event.place.latitude,
      lng: event.place.longitude,
      info_window: render_to_string(partial: "info_window", locals: { event: event })
    }
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = params[:user]
    @marker = {
      lat: @event.place.latitude,
      lng: @event.place.longitude
    }
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
