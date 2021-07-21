class MovieRating < ApplicationRecord
  belongs_to :movie

  validates_inclusion_of :rating,in: 1..5, message: 'can only be between numbers 1 - 5'
end
