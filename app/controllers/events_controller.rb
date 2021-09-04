class EventsController < ApplicationController

  before_action :set_user

  def index
    if params[:query].present?
      @events = PgSearch.multisearch(params[:query])
    else
      @events = Event.all
    if params[:user].present?
      @invitee = params[:user]
    end
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
      @user = current_user
    end
  end

  def event_params
    params.require(:event).permit(:event_type, :start_time, :place_id, :host_id, dancer_id: [])
  end
end
