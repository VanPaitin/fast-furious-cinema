class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :imdb_id
      t.jsonb :show_times, default: []
      t.float :price

      t.timestamps
    end
    add_index :movies, :imdb_id,            unique: true
  end
end
