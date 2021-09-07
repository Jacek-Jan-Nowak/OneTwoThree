class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id]) # this is why we need to nest it to groups
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      redirect_to group_chatroom_path([@group, @chatroom], anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
   params.require(:message).permit(:content)
  end
end
