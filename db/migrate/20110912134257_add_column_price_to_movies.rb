class AddColumnPriceToMovies < ActiveRecord::Migration
  def change
		add_column :movies, :price, :float
  end
end
