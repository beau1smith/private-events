class Event < ApplicationRecord
  has_many :attendees, foreign_key: :event_id, class_name: "UserEvent"
  has_many :attendees, through :user_events
  
  belongs_to :user
end
