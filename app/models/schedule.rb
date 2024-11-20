class Schedule < ApplicationRecord
    belongs_to :room
    belongs_to :user
    has_many :schedule_locations, dependent: :destroy
    has_many :locations, through: :schedule_locations

    validates :title, presence: true
    validates :latitude, numericality: true, allow_nil: true
    validates :longitude, numericality: true, allow_nil: true
end

