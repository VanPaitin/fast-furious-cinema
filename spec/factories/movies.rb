FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    imdb_id {
      "tt#{Faker::Number.send(%i(number leading_zero_number).sample, digits: 7)}"
    }

    factory :movie_with_show_times do
      transient do
        details_count { 2 }
      end
      after(:create) do |movie, evaluator|
        create_list(:movie_detail, evaluator.details_count, movie: movie)
      end
    end
  end
end
