FactoryBot.define do
  factory :location do
    association :room
    association :user
    title { "Test Location" }
    start_time { Faker::Time.forward(days: 1, period: :morning) }
    end_time { Faker::Time.forward(days: 1, period: :evening) }
    description { "This is a test location description." }
    cost { Faker::Number.between(from: 1000, to: 10_000) }
    reference_url { Faker::Internet.url }
  end
end