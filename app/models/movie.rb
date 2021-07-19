class Movie < ApplicationRecord
  validates_uniqueness_of :imdb_id
  validates_numericality_of :price, allow_nil: true

  validate :valid_show_times

  private

  def valid_show_times
    invalid_show_times = []
    show_times.each do |show_time|
      invalid_show_times << show_time unless show_time > DateTime.current
    end
    errors.add(
      :base,
      "#{invalid_show_times} are invalid as they are in the past"
    ) if invalid_show_times.present?
  end
end
