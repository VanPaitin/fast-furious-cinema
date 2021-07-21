class MovieDetail < ApplicationRecord
  belongs_to :movie

  validates_numericality_of :price
  validates_datetime :show_time, after: lambda { DateTime.current }

  scope :upcoming_times, -> do
    select(:show_time).where('show_time > ?', DateTime.current).order(show_time: :asc)
  end
end
