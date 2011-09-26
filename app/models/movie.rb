class Movie < ActiveRecord::Base
  validates :title, :presence => true
  validates :rating, :inclusion => { :in => 0.0..10.0,
   :message => "%{value} has to be between 0 and 10" }, :on => :update

	has_attached_file :pic, :styles => { :thumb => "100x100>" }
	validates_attachment_size :pic, :less_than => 50.kilobytes, :message => "can't be larger than 50KB"

	has_many :role_in_a_movies
	has_many :actors, :through => :role_in_a_movies
	has_many :movie_items
	has_many :comments, :as => :commentary

	after_update :calculate_votes, :if => :rating_changed?
	before_destroy :ensure_no_movie_items


  def rating=(value)
    write_attribute(:rating, ( (self.number_of_votes * self.rating ) + value.to_i ) / (self.number_of_votes + 1))
  end

	def calculate_votes
		Movie.increment_counter(:number_of_votes, self.id) 
	end

	def display_rating
		tmp_rate = sprintf("%3.2f", self.rating)
	end

	private

	def ensure_no_movie_items
		if movie_items.empty?
			return true
		else
			errors.add(:base, 'Movie items exist')
			return false
		end
	end
end
