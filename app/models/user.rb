class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :events, class_name: "Event", foreign_key: "host_id"
  has_many :events_users, foreign_key: "dancer_id"
  has_many :places, class_name: "Place", foreign_key: "owner_id"
  has_many :events, through: :events_users
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }
  
  has_many :invites, through: :events_users
  # has_many :places, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_label
  "#{username}"
  end
end
