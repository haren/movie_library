class AddPriceToEpisodesMoviesAndSeries < ActiveRecord::Migration
  def self.up
		add_column :episodes, :price, :decimal, :precision => 8, :scale => 2
		add_column :series, :price, :decimal, :precision => 8, :scale => 2
		add_column :movies, :price, :decimal, :precision => 8, :scale => 2
  end

	def self.down
		remove_column :episodes, :price
		remove_column :series, :price
		remove_column :movies, :price
	end
end
