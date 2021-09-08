class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  has_many :events, class_name: "Event", foreign_key: "host_id"
  has_many :places, class_name: "Place", foreign_key: "owner_id"

  has_many :groups, class_name: "Group", foreign_key: "owner_id"

  has_many :invites, class_name: "Invite", foreign_key: "invitee_id"

  has_many :messages

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }

  # has_many :places, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_label
  # to show username when selectin person to invite to dance
  "#{username}"
  end
end
