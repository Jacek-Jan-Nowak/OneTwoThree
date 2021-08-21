class Event < ApplicationRecord
  belongs_to :place

  has_many :dancers, class_name: "User"
  belongs_to :host, class_name: "User"

  has_many :invites, dependent: :destroy, through: :user_events
  validates :start_time, presence: true
  validates :name, presence: true
  validates :event_type, presence: true, inclusion: { in: ["Lesson", "Event", "Booking"] } # you can have one of these three types of events
end
