class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.integer :number_of_votes, :default => 0
      t.timestamps
    end
  end
end
