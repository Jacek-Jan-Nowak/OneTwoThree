class Event < ApplicationRecord
  belongs_to :place
  belongs_to :user, optional: true, dependent: :destroy
  validates :start_time, presence: true
  validates :name, presence: true
end
