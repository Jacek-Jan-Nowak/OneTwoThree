class Group < ApplicationRecord
  has_many :invites
  belongs_to :event
  belongs_to :owner, class_name: "User"
  after_create do
    @chatroom = Chatroom.create
    self.chatroom =  @chatroom
    self.save
  end
  has_one :chatroom
end
