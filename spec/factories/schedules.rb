FactoryBot.define do
  factory :schedule do
    association :room
    association :user
    title { "Test schedule" }
    start_time { Faker::Time.forward(days: 1, period: :morning) }
    end_time { Faker::Time.forward(days: 1, period: :evening) }
    description { "This is a test schedule description." }
    cost { Faker::Number.between(from: 1000, to: 10_000) }
    reference_url { Faker::Internet.url }
  end
end