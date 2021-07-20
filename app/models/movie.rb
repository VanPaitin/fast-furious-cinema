class Movie < ApplicationRecord
  validates_uniqueness_of :imdb_id
  validates_presence_of :title

  has_many :details, class_name: 'MovieDetail', dependent: :destroy

  accepts_nested_attributes_for :details, allow_destroy: true
end
