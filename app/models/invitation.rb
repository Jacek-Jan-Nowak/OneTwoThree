class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event, dependent: :destroy
  has_one :place, through: :event
end
