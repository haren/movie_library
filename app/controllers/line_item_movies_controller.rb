class LineItemMoviesController < ApplicationController
  # GET /line_item_movies
  # GET /line_item_movies.json
  def index
    @line_item_movies = LineItemMovie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_item_movies }
    end
  end

  # GET /line_item_movies/1
  # GET /line_item_movies/1.json
  def show
    @line_item_movie = LineItemMovie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item_movie }
    end
  end

  # GET /line_item_movies/new
  # GET /line_item_movies/new.json
  def new
    @line_item_movie = LineItemMovie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item_movie }
    end
  end

  # GET /line_item_movies/1/edit
  def edit
    @line_item_movie = LineItemMovie.find(params[:id])
  end

  # POST /line_item_movies
  # POST /line_item_movies.json
  def create
		@cart = current_cart
		movie = Movie.find(params[:movie_id])
    @line_item_movie = @cart.line_item_movies.build(:movie => movie)

    respond_to do |format|
      if @line_item_movie.save
        format.html { redirect_to @line_item_movie.cart, notice: 'Line item movie was successfully created.' }
        format.json { render json: @line_item_movie, status: :created, location: @line_item_movie }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_item_movies/1
  # PUT /line_item_movies/1.json
  def update
    @line_item_movie = LineItemMovie.find(params[:id])

    respond_to do |format|
      if @line_item_movie.update_attributes(params[:line_item_movie])
        format.html { redirect_to @line_item_movie, notice: 'Line item movie was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_item_movies/1
  # DELETE /line_item_movies/1.json
  def destroy
    @line_item_movie = LineItemMovie.find(params[:id])
    @line_item_movie.destroy

    respond_to do |format|
      format.html { redirect_to line_item_movies_url }
      format.json { head :ok }
    end
  end
end
