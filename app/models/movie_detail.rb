class MovieDetail < ApplicationRecord
  belongs_to :movie

  validates_numericality_of :price
  validates_datetime :show_time, after: lambda { DateTime.current }
end
