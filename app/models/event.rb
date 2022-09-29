class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :rsvps, foreign_key: :attended_event_id
  has_many :attendees, through: :rsvps

  validates :title, presence: true
  validates :user_id, presence: true
  validates :creator_id, presence: true
  
  scope :past, -> { where('start_time < ?', Date.today).order(date_time: :desc) }
  scope :future, -> { where('start_time > ?', Date.today).order(:date_time) }
end
