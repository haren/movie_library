class CommentsController < ApplicationController
	skip_before_filter :authorize, :only => [:show, :index]

	respond_to :html, :json

	def index
		@comments = context.comments.find(:all)

		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments}
		end
	end

	def show
		@comment = context.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
	end

	def new
		@comment = context.comments.build

		respond_with([context, @comment])
	end

	def create
    @comment = context.comments.build(params[:comment])
		@comment.by = current_user.name

    if @comment.save
			flash[:notice] = "Successfully created."
			redirect_to comments_path
		else
			flash[:alert] = "erroren"
      render :new
		end
	end

	def destroy
		@comment = context.comments.find(params[:id])
		@comment.destroy

		if @comment.destroyed?
			flash[:notice] = "Comment successfully deleted." 
		else
			flash[:notice] = "Comment failed to get destroyed." 
		end

		if context.class.name != "Episode"
			respond_with([context, :comments])
		else
			respond_with([context.series, context, :comments])
		end
	end

	
end
