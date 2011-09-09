class FixColumnRatingInModels < ActiveRecord::Migration
  def up
    remove_column :movies, :rating  
    remove_column :series, :rating
    remove_column :episodes, :rating
    add_column :movies, :rating, :integer
    add_column :episodes, :rating, :integer
    add_column :series, :rating, :integer
  end

  def down
    remove_column :movies, :rating  
    remove_column :series, :rating
    remove_column :episodes, :rating
    add_column :movies, :rating, :float
    add_column :episodes, :rating, :float
    add_column :series, :rating, :float
  end
end
