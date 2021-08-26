class UserEventsController < ApplicationController

  def new
    @user_event = UserEvent.new
  end
  
  def create
    @user_event = UserEvent.new(user_events_params)
    # @invite = Invite.new(invite_params)
  end

  def user_events_params
    params.require(:user_event).permit(:event_id, :invite_id, :is_confirmed?, dancer_id: [])
  end
  
  # def invite_params
  #   params.require(:invite).permit(:message)
  # end


end
