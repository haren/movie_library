class ChangeRatingColumnToFloatInMovies < ActiveRecord::Migration
  def up
		remove_column :movies, :rating
		add_column  :movies, :rating, :float, {:default => 0.0, :precision => 8, :scale => 2}
  end

  def down
  end
end
