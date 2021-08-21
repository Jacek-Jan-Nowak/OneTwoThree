class Place < ApplicationRecord
    has_many :events, dependent: :destroy
    belongs_to :owner, class_name: "User"
    validates :name, presence: true
    validates :address, presence: true
end
