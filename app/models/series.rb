class Series < ActiveRecord::Base
  validates :title, :presence => true

	has_attached_file :pic, :styles => { :thumb => "100x100>" }
	validates_attachment_size :pic, :less_than => 50.kilobytes, :message => "can't be larger than 50KB"

  has_many :episodes

	def calculate_price
		price_tmp = episodes.all.sum(&:price) * 0.9 unless episodes.empty?
		update_attributes(:price => price_tmp)
	end

	def title_shortened
		if title == "How I Met Your Mother"	
			return "HIMYM"
		elsif title == "The Big Bang Theory"
			return "Big Bang"
		else
			return title
		end
	end
end
