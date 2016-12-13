FactoryGirl.define do
  factory :user do
    username { Faker::Name.first_name }
    password_digest { Faker::Internet.password(8) }
    session_token { Faker::Internet.password(16) }
  end
end
