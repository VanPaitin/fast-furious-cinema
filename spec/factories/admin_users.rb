FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }
  end
end
