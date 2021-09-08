class InvitesController < ApplicationController
  # before_action :set_user
  # before_action :set_event
  before_action :set_invite, only: [:show, :edit, :update, :destroy]
  

  def index
    @invites = @event.invites
    @user = current_user
  end

  def new
    @invite = Invite.new
    @user = params[:user]
    @event = params[:event] 
    if params[:group]
      @group = params[:group]
    else
      @group = Group.new
    end
  end

  def create
    if params[:group]
      @invite = Invite.new
      @invite.invitee = User.find(params[:user])
      @invite.message = params[:message]
      @invite.group = Group.find(params[:group])
      @invite.save

        if @invite.save
          redirect_to group_path(Group.find(params[:group]))
        else
          render :new
        end

    else

        @event = Event.find(params[:event])
        @user = User.find(params[:user])
        @group = Group.new
        @group.event = @event
        @group.owner = current_user
        @group.name = params[:group_name]
        @group.save
        
        @invite = Invite.new
        @invite.invitee = current_user
        @invite.message = params[:message]
        @invite.group = @group
        @invite.save

        @invite = Invite.new
        @invite.invitee = @user
        @invite.message = params[:message]
        @invite.group = @group
        @invite.save

        if @invite.save
          redirect_to group_path(@group)
        else
          render :new
        end

    end
  end

  def join
    @event = Event.find(params[:event])
    @group = Group.new
    @group.event = @event
    @group.owner = current_user
    @group.name = "#{current_user.username}'s group"
    @group.save
    
    @invite = Invite.new
    @invite.invitee = current_user
    @invite.message = ""
    @invite.group = @group
    @invite.save

    if @invite.save
      redirect_to group_path(@group)
    end
  end
    # #this will create events_user for the dancer
    # create_events_user(params[:user_id], params[:event_id], @invite)

    #this will create events_user for the current user
    # create_events_user(params[:event_id], current_user.id, @invite)



  def edit
  end

  def show
    # @user = current_user
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

  # def  create_events_user(user_id, event_id, invite)
  #   @events_user = EventsUser.new
  #   @events_user.invite = @invite
  #   @events_user.event = Event.find(event_id)
  #   @events_user.dancer = User.find(user_id)
  #   @events_user.save
  # end


  # def set_event
  #   @event = Event.find(params[:event])
  # end

  # def set_user
  #   @user = User.find(params[:user])
  # end

  def set_invite
    @invite = Invite.find(params[:id])
  end
  # mike will work on this later on
  # def  create_current_events_user
  #   @events_user = UserEvent.new
  #   @events_user.invite = @invite
  #   @events_user.event = Event.find(params[:event_id])
  #   @events_user.organiser = User.find(current_user)
  #   @events_user.save
  # end
  

  def invite_params
    params.require(:invite).permit(:message, :event, :user, :current_user, :group)
  end


end
