class CreateRoleInAMovies < ActiveRecord::Migration
  def change
    create_table :role_in_a_movies do |t|
      t.integer :actor_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
