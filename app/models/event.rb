class Event < ApplicationRecord
  belongs_to :place
  belongs_to :user, optional: true
  validates :start_time, presence: true
  validates :name, presence: true
  validates :event_type, presence: true, inclusion: { in: ["Lesson", "Event", "Booking"] } # you can have one of these three types of events
end
