class Event < ApplicationRecord
  belongs_to :creator, class: "User"
end
