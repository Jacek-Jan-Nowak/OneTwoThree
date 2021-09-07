class Event < ApplicationRecord
  belongs_to :place
  #reverse_geocoded_by 'place.latitude', 'place.longitude'
  geocoded_by 'place.address'
  has_many :groups
  belongs_to :host, class_name: "User"
  has_many :invites, dependent: :destroy, through: :groups
  # do we need has many users?


  validates :start_time, presence: true
  validates :name, presence: true
  validates :event_type, presence: true, inclusion: { in: ["Lesson", "Event", "Booking"] } # you can have one of these three types of events
  # has_many :dancers, class_name: "User", through: :events_users
end
