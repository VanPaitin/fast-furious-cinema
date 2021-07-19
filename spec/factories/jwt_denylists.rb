FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2021-07-19 16:16:23" }
  end
end
