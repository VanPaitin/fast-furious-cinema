class MovieSerializer
  include JSONAPI::Serializer

  attributes :title, :imdb_id

  attribute :show_times do |object|
    object.details.upcoming_times.pluck(:show_time)
  end
end
