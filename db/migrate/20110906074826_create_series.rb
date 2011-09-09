class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :title
      t.integer :episodes, :default => 0
      t.float :rating, :default => 0.0
      t.integer :number_of_votes, :default => 0

      t.timestamps
    end
  end
end
