class Movie < ApplicationRecord
  validates_uniqueness_of :imdb_id
  validates_presence_of :title

  has_many :details, class_name: 'MovieDetail', dependent: :destroy
  has_many :ratings, class_name: 'MovieRating', dependent: :destroy

  accepts_nested_attributes_for :details, allow_destroy: true

  def rating
    ratings.average(:rating)
  end
end
