class Room < ApplicationRecord
    has_many :room_users
    has_many :users, through: :room_users
    has_many :schedules, dependent: :destroy
    has_many :locations, dependent: :destroy
    has_many :chat_histories, dependent: :destroy

    validates :room_name, presence: true
end
