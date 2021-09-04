class Place < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
    has_many :events, dependent: :destroy
    belongs_to :owner, class_name: "User"
    validates :name, presence: true
    validates :address, presence: true
    include PgSearch::Model
    multisearchable against: [:address]
end
