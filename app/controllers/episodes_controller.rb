class EpisodesController < ApplicationController
	skip_before_filter :authorize, :only => [:index, :show]
 
 respond_to :html, :json

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = series.episodes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @episodes }
    end
  end
  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode = series.episodes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @episode }
    end
  end
 
  # GET /episodes/new
  # GET /episodes/new.json
  def new
		@episode = series.episodes.build

		respond_with([series, @episode])

  end

  # GET /episodes/1/edit
  def edit
    @episode = series.episodes.find(params[:id])
  end

  # POST /episodes
  # POST /episodes.json

	# TODO CHECK WHY DIDN'T WORK WITH RESPOND_WITH
  def create
    @episode = series.episodes.build(params[:episode])
    if @episode.save
			flash[:notice] = "Successfully created"
			redirect_to [series, @episode]
		else
			flash[:alert] = "erroren"
      render :new
		end

		# debugger

    # respond_with([@series, @episode])
  end

  # PUT /episodes/1
  # PUT /episodes/1.json
  def update
    @episode = series.episodes.find(params[:id])
		

		flash[:notice] = "Episode was successfully updated." if @episode.update_attributes(params[:episode])
		respond_with([series, @episode])

  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = series.episodes.find(params[:id])
    @episode.destroy

		if @episode.destroyed?
			flash[:notice] = "Episode successfully destroyed." 
		else
			flash[:notice] = "Episode failed to get destroyed." 
		end
		respond_with([series, :episodes])
  end


  protected

	def series
    @series ||= Series.find(params[:series_id])
	end
end
