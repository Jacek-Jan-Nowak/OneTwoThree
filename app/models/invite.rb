class Invite < ApplicationRecord
  belongs_to :invitee, class_name: "User"
  belongs_to :inviter, class_name: "User"
  belongs_to :group

  # has_many :events, through: :groups
end
