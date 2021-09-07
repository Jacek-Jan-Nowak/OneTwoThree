class GroupsController < ApplicationController
  before_action :set_user

  def index
      @groups = Group.all
      if params[:user].present?
        @invitee = params[:user]
      end
      if params[:event].present?
        @event = params[:event]
      end
  end

  def show
    @group = Group.find(params[:id])
    @user = params[:user]
    @event = params[:event]
  end

  def new
    @group = Group.new

  end

  def create
    @group = Group.new(group_params)
    @group.event_id = @event
    @group.owner_id = @current_user
    
    if @group.save
      # redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    @group.delete
    rediret_to profile_path
  end

  private

  def set_user
    if user_signed_in?
      @current_user = current_user
    end
  end

  def group_params
    params.require(:group).permit(:name, :event_id, :owner_id)
  end
end

