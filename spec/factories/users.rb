FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { "good_password" }

    factory :new_user do
      username {"new_user"}
    end
  end
end
