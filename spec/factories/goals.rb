FactoryBot.define do
  factory :goal do
    title { Faker::Lorem.words(number: 5).join(" ") }
    details { Faker::Lorem.words(number: 10).join(" ") }
  end
end
