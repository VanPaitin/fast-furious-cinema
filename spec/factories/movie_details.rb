FactoryBot.define do
  factory :movie_detail do
    show_time { 2.days.from_now }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2)  }
    movie
  end
end
