class Comment < ActiveRecord::Base
	validates :content, :presence => true

	belongs_to :commentary, :polymorphic => true
end
