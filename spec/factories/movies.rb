FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    imdb_id {
      "tt#{Faker::Number.send(%i(number leading_zero_number).sample, digits: 7)}"
    }
  end
end
