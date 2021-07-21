class CreateMovieRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_ratings do |t|
      t.integer :rating
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
