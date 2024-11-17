class Schedule < ApplicationRecord
    belongs_to :room
    belongs_to :user

    validates :title, presence: true
    validates :latitude, numericality: true, allow_nil: true
    validates :longitude, numericality: true, allow_nil: true
end

