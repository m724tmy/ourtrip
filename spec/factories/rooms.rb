FactoryBot.define do
  factory :room do
    room_name  { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    start_time  { Faker::Time.forward(days: 23, period: :morning) }
    end_time    { Faker::Time.forward(days: 23, period: :afternoon) }
  end
end
