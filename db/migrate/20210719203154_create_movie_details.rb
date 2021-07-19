class CreateMovieDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_details do |t|
      t.datetime :show_time
      t.float :price
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
