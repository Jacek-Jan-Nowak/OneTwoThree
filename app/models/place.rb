class Place < ApplicationRecord
    has_many :events, dependent: :destroy
    validates :name, presence: true
    validates :address, presence: true
end
