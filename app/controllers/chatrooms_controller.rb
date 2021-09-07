class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @group = Group.find(params[:group_id])
    @message = Message.new
  end
end
