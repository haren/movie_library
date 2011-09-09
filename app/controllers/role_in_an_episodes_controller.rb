class RoleInAnEpisodesController < ApplicationController
  # GET /role_in_an_episodes
  # GET /role_in_an_episodes.json
  def index
    @role_in_an_episodes = RoleInAnEpisode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_in_an_episodes }
    end
  end

  # GET /role_in_an_episodes/1
  # GET /role_in_an_episodes/1.json
  def show
    @role_in_an_episode = RoleInAnEpisode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role_in_an_episode }
    end
  end

  # GET /role_in_an_episodes/new
  # GET /role_in_an_episodes/new.json
  def new
    @role_in_an_episode = RoleInAnEpisode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role_in_an_episode }
    end
  end

  # GET /role_in_an_episodes/1/edit
  def edit
    @role_in_an_episode = RoleInAnEpisode.find(params[:id])
  end

  # POST /role_in_an_episodes
  # POST /role_in_an_episodes.json
  def create
    @role_in_an_episode = RoleInAnEpisode.new(params[:role_in_an_episode])

    respond_to do |format|
      if @role_in_an_episode.save
        format.html { redirect_to @role_in_an_episode, notice: 'Role in an episode was successfully created.' }
        format.json { render json: @role_in_an_episode, status: :created, location: @role_in_an_episode }
      else
        format.html { render action: "new" }
        format.json { render json: @role_in_an_episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /role_in_an_episodes/1
  # PUT /role_in_an_episodes/1.json
  def update
    @role_in_an_episode = RoleInAnEpisode.find(params[:id])

    respond_to do |format|
      if @role_in_an_episode.update_attributes(params[:role_in_an_episode])
        format.html { redirect_to @role_in_an_episode, notice: 'Role in an episode was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @role_in_an_episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_in_an_episodes/1
  # DELETE /role_in_an_episodes/1.json
  def destroy
    @role_in_an_episode = RoleInAnEpisode.find(params[:id])
    @role_in_an_episode.destroy

    respond_to do |format|
      format.html { redirect_to role_in_an_episodes_url }
      format.json { head :ok }
    end
  end
end
