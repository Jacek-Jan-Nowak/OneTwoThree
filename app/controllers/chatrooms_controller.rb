class ChatroomsController < ApplicationController
  def chat
    # @chatroom = Chatroom.find(params[:id])
  
    @group = Group.find(params[:id])
    @chatroom = @group.chatroom
    @message = Message.new
  end
end
