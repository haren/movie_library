require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "create user without parameters fail" do
		user = User.create
		assert user.invalid?
		assert user.errors[:name].any?
		assert user.errors[:password].any?
		assert user.errors[:email].any?
	end

	test "create two users with the same name fail" do
		user = User.create(:name => "Marian", :password => "Tomasz", :email => "koza@wp.pw")
		user2 = User.new(:name => "Marian", :password => "T", :email => "kozdsa@wp.pw")
		assert user.valid?
		assert !user2.save
		assert user2.errors[:name].any?
		assert user2.errors[:email].empty?

		user2.name = "Marian2"
		assert user2.save
	end

end
