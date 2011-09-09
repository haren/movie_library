class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :number
      t.float :rating, :default => 0.0
      t.integer :number_of_votes, :default => 0

      t.timestamps
    end
  end
end
