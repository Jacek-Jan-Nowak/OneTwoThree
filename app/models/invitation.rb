class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :place, through: :event
end
