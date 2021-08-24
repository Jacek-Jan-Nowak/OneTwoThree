class InvitesController < ApplicationController
  before_action :find_invite, only: [:edit, :update, :destroy]
  before_action :set_event, except: [:destroy]

  def index
    @invites = Invite.all
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.create(invite_params)
    @invite.event = @event
    if @invite.save
      # redirect_to event_user_invites_path([ @event, @user, @invite ])
    else
      render :new
    end
  end

    def edit
    end

    def update
      @invite.update(invite_params)
      if @Invite.save
        redirect_to event_path(@event)
      else
        render :edit
      end
    end

    def destroy
      @invite.delete
      @event = @invite.event
      redirect_to event_path(@event)
    end

    private

    def find_invite
      @invite = Invite.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def invite_params
      params.require(:invite).permit(:event_id, :user_id)
    end

end
