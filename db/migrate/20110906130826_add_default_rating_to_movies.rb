class AddDefaultRatingToMovies < ActiveRecord::Migration
  def change
	change_column :movies, :rating, :integer, {:default =>0}
  end
end
