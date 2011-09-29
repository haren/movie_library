# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "MyName#{n}" }
		password 'Jacek'
		email 'JacekMaciek@JM.jm'
  end

	factory :movie do
		title 'Seksmisja'
	end

	factory :series do
		title 'HIMYM'
	end

	factory	:episode do
		title 'Pilot'
		number 1
		price 15.67
		series
	end

	factory :cart do
		user
	end

	factory :episode_item do
		episode
		cart
	end

	factory :movie_item do
		movie
		cart
	end

	factory :order do
		name 'John'
		email 'John@john.doe'
		pay_type 'Bank transfer'
		address 'Long Street 56-789 London'
	end	
end
