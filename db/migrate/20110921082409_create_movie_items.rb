class CreateMovieItems < ActiveRecord::Migration
  def change
    create_table :movie_items do |t|
      t.integer :movie_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps
    end
  end
end
