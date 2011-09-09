class Actor < ActiveRecord::Base
	has_many :role_in_a_movies
	has_many :movies, :through => :role_in_a_movies

	has_attached_file :pic, :styles => { :thumb => "100x100>" }
	validates_attachment_size :pic, :less_than => 50.kilobytes, :message => "can't be larger than 50KB"

	has_attached_file :attach
end
