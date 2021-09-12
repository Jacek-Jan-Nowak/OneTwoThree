class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id]) # this is why we need to nest it to groups
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      # send to channel
      ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "messages/message", locals: { message: @message })
      )
      redirect_to group_path(@chatroom)
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
   params.require(:message).permit(:content)
  end
end
