class Episode < ActiveRecord::Base
  validates :title, :presence => true
  validates :number, :presence => true, :uniqueness => {:scope => :series_id, :message => ": The episode with a provided number already exists."}

	after_save :increment_episodes_count
	after_destroy :decrement_episodes_count

  belongs_to :series
	has_and_belongs_to_many :actors

	protected
	
	def increment_episodes_count
		Series.increment_counter(:number_of_episodes, series.id)
	end

	def decrement_episodes_count
		Series.decrement_counter(:number_of_episodes, series.id)
	end

end
