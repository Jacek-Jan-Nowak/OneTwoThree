class Event < ApplicationRecord
  belongs_to :place
  belongs_to :user, optional: true
  validates :start_time, presence: true
  validates :name, presence: true
end
