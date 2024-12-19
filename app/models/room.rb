class Room < ApplicationRecord
    has_many :room_users
    has_many :users, through: :room_users
    has_many :schedules, dependent: :destroy
    has_many :locations, dependent: :destroy
    has_many :chat_histories, dependent: :destroy

    validates :room_name, presence: true

    before_create :generate_invite_token

    private

    def generate_invite_token
      self.invite_token = SecureRandom.hex(10)
    end
end
