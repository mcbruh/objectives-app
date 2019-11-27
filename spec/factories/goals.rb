FactoryBot.define do
  factory :goal do
    title { Faker::Lorem.words(5).join(" ") }
    details { Faker::Lorem.words(10).join(" ") }
  end
end
