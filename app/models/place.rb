class Place < ApplicationRecord
    has_many :events
    validates :name, presence: true
    validates :address, presence: true
end
