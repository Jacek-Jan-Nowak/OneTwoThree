class InvitationsController < ApplicationController
  before_action :find_invitation, only: [:edit, :update, :destroy]
  before_action :set_event, except: [:destroy]

  def index
    @invitations = Invitation.all

  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.create(invitation_params)
    @invitation.event = @event
    if @invitation.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

    def edit
    end

    def update
      @invitation.update(invitation_params)
      if @Invitation.save
        redirect_to event_path(@event)
      else
        render :edit
      end
    end

    def destroy
      @invitation.delete
      @event = @invitation.event
      redirect_to event_path(@event)
    end

    private

    def find_invitation
      @invitation = Invitation.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def invitation_params
      params.require(:review).permit(:event_id, :user_id)
    end

end
