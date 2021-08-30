class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :events, class_name: "Event", foreign_key: "host_id"
  has_many :events_users, class_name: "EventUser", foreign_key: "dancer_id"
  has_many :places, class_name: "Place", foreign_key: "owner_id"


  has_many :invites, through: :events_users
  # has_many :places, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_label
  "#{username}"
  end
end
