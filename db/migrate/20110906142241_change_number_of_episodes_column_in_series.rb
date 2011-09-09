class ChangeNumberOfEpisodesColumnInSeries < ActiveRecord::Migration
  def up
		rename_column :series, :episodes, :number_of_episodes
  end

  def down
		rename_column :series, :number_of_episodes, :episodes
  end
end
