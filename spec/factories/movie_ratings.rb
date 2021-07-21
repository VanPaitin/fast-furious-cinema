FactoryBot.define do
  factory :movie_rating do
    rating { Faker::Number.within(range: 1..5) }
    movie
  end
end
