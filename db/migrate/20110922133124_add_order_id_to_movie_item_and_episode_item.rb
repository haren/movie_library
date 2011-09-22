class AddOrderIdToMovieItemAndEpisodeItem < ActiveRecord::Migration
  def self.up
		add_column :movie_items, :order_id, :integer
		add_column :episode_items, :order_id, :integer
  end

	def self.down
		remove_column :movie_items, :order_id
		remove_column :episode_items, :order_id
	end
end
