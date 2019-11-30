FactoryBot.define do
  factory :goal_comment do
    content { "MyText" }
    user_id { 1 }
    goal_id { 1 }
  end
end
