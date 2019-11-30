FactoryBot.define do
  factory :user_comment do
    content { "MyText" }
    user_id { 1 }
  end
end
