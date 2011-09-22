class Episode < ActiveRecord::Base
  validates :title, :presence => true
  validates :number, :presence => true, :uniqueness => {:scope => :series_id, :message => ": The episode with a provided number already exists."}

	after_create :increment_episodes_count
	after_destroy :decrement_episodes_count
	before_destroy :ensure_no_episode_items
	after_save :series_calculate_price
	after_destroy :series_calculate_price
	
	delegate :calculate_price, :prefix => true, :to => :series

  belongs_to :series
	has_and_belongs_to_many :actors
	has_many :episode_items

	protected
	
	def increment_episodes_count
		Series.increment_counter(:number_of_episodes, series.id)
	end

	def decrement_episodes_count
		Series.decrement_counter(:number_of_episodes, series.id)
	end

	private
	
	def ensure_no_episode_items
		if movie_items.empty?
			return true
		else
			errors.add(:base, 'Movie items exist')
			return false
		end
	end
end
