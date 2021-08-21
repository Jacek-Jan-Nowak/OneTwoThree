class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :events, class_name: "Event", foreign_key: "host_id"
  has_many :user_events, class_name: "UserEvent", foreign_key: "dancer_id"
  
  has_many :invites, through: :user_events
  has_many :places, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_label
  "#{username}"
  end
end
