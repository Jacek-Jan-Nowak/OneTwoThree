class Invite < ApplicationRecord
  has_many :dancers, class_name: "User", through: :user_events
end
