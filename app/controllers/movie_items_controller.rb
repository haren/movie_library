class MovieItemsController < ApplicationController
	skip_before_filter :authorize, :only => :create

  # GET /movie_items
  # GET /movie_items.json
  def index
    @movie_items = MovieItem.all
		redirect_to root_path, :notice => "You are not supposed to view this page."
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @movie_items }
#    end
  end

  # GET /movie_items/1
  # GET /movie_items/1.json
  def show
    @movie_item = MovieItem.find(params[:id])
		redirect_to root_path, :notice => "You are not supposed to view this page."
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @movie_item }
#    end
  end

  # GET /movie_items/new
  # GET /movie_items/new.json
  def new
    @movie_item = MovieItem.new
		redirect_to root_path, :notice => "You are not supposed to view this page."
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @movie_item }
#    end
  end

  # GET /movie_items/1/edit
  def edit
    @movie_item = MovieItem.find(params[:id])
		redirect_to root_path, :notice => "You are not supposed to view this page."
  end

  # POST /movie_items
  # POST /movie_items.json
  def create
		@cart = current_cart
		logger.error "discount: #{@cart.discount}"
	  movie = Movie.find(params[:movie_id])
		@movie_item = @cart.add_movie(movie.id, movie.price)

    respond_to do |format|
      if @movie_item.save
        format.html { redirect_to movies_path }
        format.json { render json: @movie_item, status: :created, location: @movie_item }
      else
        format.html { render action: "new" }
        format.json { render json: @movie_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movie_items/1
  # PUT /movie_items/1.json
  def update
    @movie_item = MovieItem.find(params[:id])

    respond_to do |format|
      if @movie_item.update_attributes(params[:movie_item])
        format.html { redirect_to @movie_item, notice: 'Movie item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_items/1
  # DELETE /movie_items/1.json
  def destroy
    @movie_item = MovieItem.find(params[:id])
    @movie_item.update_quantity
		@movie_item.destroy if @movie_item.quantity == 0

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :ok }
    end
  end
end
