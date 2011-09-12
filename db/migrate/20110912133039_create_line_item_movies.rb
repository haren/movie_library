class CreateLineItemMovies < ActiveRecord::Migration
  def change
    create_table :line_item_movies do |t|
      t.integer :movie_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
