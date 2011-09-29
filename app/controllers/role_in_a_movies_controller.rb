class RoleInAMoviesController < ApplicationController
  # GET /role_in_a_movies
  # GET /role_in_a_movies.json
  def index
    @role_in_a_movies = RoleInAMovie.all

    redirect_to root_path, :notice => "You are not supposed to view this page."
  end

  # GET /role_in_a_movies/1
  # GET /role_in_a_movies/1.json
  def show
    @role_in_a_movie = RoleInAMovie.find(params[:id])

		redirect_to root_path, :notice => "You are not supposed to view this page."  
end

  # GET /role_in_a_movies/new
  # GET /role_in_a_movies/new.json
  def new
    @role_in_a_movie = RoleInAMovie.new

    redirect_to root_path, :notice => "You are not supposed to view this page."
  end

  # GET /role_in_a_movies/1/edit
  def edit
    @role_in_a_movie = RoleInAMovie.find(params[:id])

		redirect_to root_path, :notice => "You are not supposed to view this page."
  end

  # POST /role_in_a_movies
  # POST /role_in_a_movies.json
  def create
    @role_in_a_movie = RoleInAMovie.new(params[:role_in_a_movie])

    respond_to do |format|
      if @role_in_a_movie.save
        format.html { redirect_to @role_in_a_movie, notice: 'Role in a movie was successfully created.' }
        format.json { render json: @role_in_a_movie, status: :created, location: @role_in_a_movie }
      else
        format.html { render action: "new" }
        format.json { render json: @role_in_a_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /role_in_a_movies/1
  # PUT /role_in_a_movies/1.json
  def update
    @role_in_a_movie = RoleInAMovie.find(params[:id])

    respond_to do |format|
      if @role_in_a_movie.update_attributes(params[:role_in_a_movie])
        format.html { redirect_to @role_in_a_movie, notice: 'Role in a movie was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @role_in_a_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_in_a_movies/1
  # DELETE /role_in_a_movies/1.json
  def destroy
    @role_in_a_movie = RoleInAMovie.find(params[:id])
    @role_in_a_movie.destroy

    respond_to do |format|
      format.html { redirect_to role_in_a_movies_url }
      format.json { head :ok }
    end
  end
end
