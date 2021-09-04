class Group < ApplicationRecord
  has_many :invites
  belongs_to :event
  belongs_to :owner, class_name: "User"
end
