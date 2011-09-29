class EpisodeItemsController < ApplicationController
  # GET /episode_items
  # GET /episode_items.json
  def index
    redirect_to root_path, :notice => "You are not supposed to view this page."
  end

  # GET /episode_items/1
  # GET /episode_items/1.json
  def show
    @episode_item = EpisodeItem.find(params[:id])

    redirect_to root_path, :notice => "You are not supposed to view this page."
  end

  # GET /episode_items/new
  # GET /episode_items/new.json
  def new
    @episode_item = EpisodeItem.new
		
		redirect_to root_path, :notice => "You are not supposed to view this page."
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @episode_item }
#    end
  end

  # GET /episode_items/1/edit
  def edit
    @episode_item = EpisodeItem.find(params[:id])
		redirect_to root_path, :notice => "You are not supposed to view this page."
  end

  # POST /episode_items
  # POST /episode_items.json
  def create

    @cart = current_cart
	  episode = Episode.find(params[:episode_id])
		@episode_item = @cart.add_episode(episode.id, episode.price)

		if @episode_item && @cart.discount_update_needed?("c", @episode_item.episode.series)
			@cart.update_discount(@episode_item.episode.series.episodes.all.sum(&:price) * 0.1) 
		end								

    respond_to do |format|
      if @episode_item.save
        format.html { redirect_to [episode.series, :episodes] }
        format.json { render json: @episode_item, status: :created, location: @episode_item }
      else
        format.html { render action: "new" }
        format.json { render json: @episode_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /episode_items/1
  # PUT /episode_items/1.json
  def update
    @episode_item = EpisodeItem.find(params[:id])

    respond_to do |format|
      if @episode_item.update_attributes(params[:episode_item])
        format.html { redirect_to @episode_item, notice: 'Episode item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @episode_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episode_items/1
  # DELETE /episode_items/1.json
  def destroy
    @episode_item = EpisodeItem.find(params[:id])
		@episode_item.update_quantity
		@cart = current_cart
		logger.info "in_destroy"
		if @cart.discount_update_needed?("d", @episode_item.episode.series)
			logger.info "Returned true"
			@cart.update_discount(-@episode_item.episode.series.episodes.all.sum(&:price) * 0.1) 
		end

    @episode_item.destroy if @episode_item.quantity == 0

    respond_to do |format|
      format.html { redirect_to series_index_url }
      format.json { head :ok }
    end
  end

	def order_all_episodes
		@series = Series.find(params[:id])
		@cart = current_cart
		@cart.add_all_episodes(@series)

		respond_to do |format|
      format.html { redirect_to series_index_url }
      format.json { head :ok }
    end
	end
end
