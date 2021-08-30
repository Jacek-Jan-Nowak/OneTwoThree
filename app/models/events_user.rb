class EventsUser < ApplicationRecord
  belongs_to :dancer, class_name: "User"
  belongs_to :event
  belongs_to :invite

end
