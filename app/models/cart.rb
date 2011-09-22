class Cart < ActiveRecord::Base
	has_many :movie_items	
	has_many :episode_items

	def add_movie(movie_id, movie_price)
		current_item = movie_items.find_by_movie_id(movie_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = MovieItem.new(:movie_id => movie_id, :quantity => 1)
			movie_items << current_item
		end
		current_item
	end

	def add_episode(episode_id,episode_price)
		current_item = episode_items.find_by_episode_id(episode_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = EpisodeItem.new(:episode_id => episode_id, :quantity => 1)
			episode_items << current_item
		end
		if current_item.save
			return current_item
		else
			return false
		end
	end

	def total_price
		tmp_price = 0
		movie_items.all.each do |item|
			tmp_price += item.movie.price * item.quantity
		end
		episode_items.all.each do |item|
			tmp_price += item.episode.price * item.quantity
		end
		tmp_price - discount
	end
	
	def add_all_episodes(series)
		series.episodes.all.each do |episode|
			add_episode(episode.id, episode.price)
		end
		update_discount(series.episodes.all.sum(&:price) * 0.1)
	end

	def discount_update_needed?(contr, series)
		series_episodes_in_cart_quantities = []

		episode_items.all.each do |item|
			series_episodes_in_cart_quantities << item.quantity if item.episode.series == series && item.quantity > 0
		end

		logger.info "dupa#{series_episodes_in_cart_quantities.count}"
		
		return true if contr == "c" && series_episodes_in_cart_quantities.count == series.episodes.count &&
											series_episodes_in_cart_quantities.max - series_episodes_in_cart_quantities.min == 0
		return true if contr == "d" && series_episodes_in_cart_quantities.count == series.episodes.count - 1
		return true if contr == "d"	&& series_episodes_in_cart_quantities.count == series.episodes.count &&
																	 series_episodes_in_cart_quantities.max - series_episodes_in_cart_quantities.min == 1 &&
																	 series_episodes_in_cart_quantities.find_all{|i| i == series_episodes_in_cart_quantities.max}.count == 																					series_episodes_in_cart_quantities.count - 1	
		return false
	end

	def update_discount(amount)
		update_attribute :discount, discount + amount
	end	
end
