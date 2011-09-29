class SettingDefaultPricesToZero < ActiveRecord::Migration
  def up
		change_column :movies, :price, :decimal, :default => 0, :precision => 8, :scale => 2
		change_column :series, :price, :decimal, :default => 0, :precision => 8, :scale => 2
		change_column :episodes, :price, :decimal, :default => 0, :precision => 8, :scale => 2
  end

  def down
  end
end
