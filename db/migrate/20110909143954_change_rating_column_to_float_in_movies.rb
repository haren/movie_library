class ChangeRatingColumnToFloatInMovies < ActiveRecord::Migration
  def up
		drop_column :movies, :rating
		add_column  :movies, :rating, :float, {:default => 0.0, :precision => 2}
  end

  def down
  end
end
