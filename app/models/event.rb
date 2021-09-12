class Event < ApplicationRecord
  belongs_to :place
  has_many :groups
  belongs_to :host, class_name: "User"
  has_many :invites, dependent: :destroy, through: :groups
  # do we need has many users?

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    against: [:name],
    associated_against: {
      place: [ :address ]
    },
    using: {
      tsearch: { prefix: true }
    }

  validates :start_time, presence: true
  validates :name, presence: true
  validates :event_type, presence: true, inclusion: { in: ["Lesson", "Event", "Booking"] } # you can have one of these three types of events
  # has_many :dancers, class_name: "User", through: :events_users
end
