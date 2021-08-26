class InvitesController < ApplicationController

  def index
    @invites = Invite.all
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.create(invite_params)

    @user_event = UserEvent.new
    @user_event.invite = @invite
    @user_event.event = Event.find(params[:event_id])
    @user_event.dancer = User.find(params[:user_id])

    if @invite.save && @user_event.save
      
      redirect_to event_users_path([ @user_event, @invite ])
    else
      render :new
    end
  end

    def edit
    end

    def update
      @invite.update(invite_params)
      if @Invite.save
        # redirect_to event_path(@event)
      else
        render :edit
      end
    end

    def destroy
      @invite.delete
      @event = @invite.event
      # redirect_to event_path(@event)
    end

    private


   

    def invite_params
      params.require(:invite).permit(:event_id, :message, dancer_id: [])
    end

 

end
