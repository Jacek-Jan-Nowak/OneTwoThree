class InvitesController < ApplicationController

  def index
    @invites = Invite.all
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.create(invite_params)

    #this will create user_event for the dancer
    create_user_event(params[:event_id], params[:user_id], @invite)

    #this will create user_event for the current user
    create_user_event(params[:event_id], current_user.id, @invite)

    if @invite.save && @user_event.save
      redirect_to user_event_path(@user_event)
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
  
  def  create_user_event(event_id, user_id, invite)
    @user_event = UserEvent.new
    @user_event.invite = invite
    @user_event.event = Event.find(event_id)
    @user_event.dancer = User.find(user_id)
    @user_event.save
  end


  # mike will work on this later on
  # def  create_current_user_event
  #   @user_event = UserEvent.new
  #   @user_event.invite = @invite
  #   @user_event.event = Event.find(params[:event_id])
  #   @user_event.organiser = User.find(current_user)
  #   @user_event.save
  # end
  

  def invite_params
    params.require(:invite).permit(:event_id, :message, user_id: [])
  end

 

end
