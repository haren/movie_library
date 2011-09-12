class Movie < ActiveRecord::Base
  validates :title, :presence => true
  validates :rating, :inclusion => { :in => 1.0..10.0,
   :message => "%{value} has to between 1 and 10" }, :on => :update
	validates :price, :presence => true, :numericality => {:greater_than_or_equal_to => 0.01}

	has_attached_file :pic, :styles => { :thumb => "100x100>" }
	validates_attachment_size :pic, :less_than => 50.kilobytes, :message => "can't be larger than 50KB"

	has_many :role_in_a_movies
	has_many :actors, :through => :role_in_a_movies
	has_many :line_item_movies

	after_update :calculate_votes, :if => :rating_changed?
	before_destroy :ensure_not_referenced_by_any_line_item_movie


  def rating=(value)
    write_attribute(:rating, ( (self.number_of_votes * self.rating ) + value.to_f) / (self.number_of_votes + 1))
  end

	def calculate_votes
		Movie.increment_counter(:number_of_votes, self.id) 
	end

	def display_rating
		to_display = sprintf("%3.2f", self.rating)
	end

	def ensure_not_referenced_by_any_line_item_movie
		if line_item_movies.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end


end
