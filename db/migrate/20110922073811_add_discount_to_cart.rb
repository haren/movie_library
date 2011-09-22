class AddDiscountToCart < ActiveRecord::Migration
  def self.up
		add_column :carts, :discount, :decimal, :precision => 8, :scale => 2, :default => 0
  end

	def self.down
		remove_column :carts, :discount
	end
end
