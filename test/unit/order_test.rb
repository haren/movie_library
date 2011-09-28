require 'test_helper'

class OrderTest < ActiveSupport::TestCase
	fixtures :orders
  test "validation_on_creation" do
		@order = Order.new(:name => "sho")
		@order2 = Order.new(:name => "long enough", :address => "too short")
		@order3 = Order.new(:name => "long enough", :address => "long enough tatataa", :email => "wrong")
		@order4 = Order.new(:name => "long enough", :address => "long enough tatataa", :email => "thisonewill@be.ok", :pay_type => "wrong again")
		@order5 = Order.new(:name => "long enough", :address => "long enough tatataa", :email => "thisonewill@be.ok", :pay_type => "Check")

		assert @order.invalid?
		assert @order2.invalid?
		assert @order3.invalid?
		assert @order4.invalid?
		assert @order5.valid?
		assert orders(:one).invalid?
		assert orders(:two).valid?
	end
end
