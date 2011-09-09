class Series < ActiveRecord::Base
  validates :title, :presence => true

	has_attached_file :pic, :styles => { :thumb => "100x100>" }
	validates_attachment_size :pic, :less_than => 50.kilobytes, :message => "can't be larger than 50KB"

  has_many :episodes
end
