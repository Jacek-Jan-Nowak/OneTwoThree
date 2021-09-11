class Review < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: "User"
end
