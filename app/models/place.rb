class Place < ApplicationRecord
    has_many :events, dependent: :destroy
    # belongs_to :user
    validates :name, presence: true
    validates :address, presence: true
end
