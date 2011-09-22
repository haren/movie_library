class AddPriceToOrder < ActiveRecord::Migration
  def self.up
		add_column :orders, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
		drop_column :orders, :price
  end
end
