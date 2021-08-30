class Invite < ApplicationRecord
  has_many :dancers, class_name: "User", through: :events_users
  has_many :events_users
end
