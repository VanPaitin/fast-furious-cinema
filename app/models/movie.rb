class Movie < ApplicationRecord
  validates_uniqueness_of :imdb_id
  validates_presence_of :title

  has_many :movie_details, dependent: :destroy

  accepts_nested_attributes_for :movie_details, allow_destroy: true
end
