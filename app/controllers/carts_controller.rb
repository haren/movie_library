class CartsController < ApplicationController
	skip_before_filter :authorize, :only => [:create, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    redirect_to root_path, :notice => "You are not supposed to view this page."
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
		begin
			@cart = Cart.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			logger.error "Attempt to access invalid cart #{params[:id]}"
			redirect_to root_path, :notice => 'You are not supposed to view this page.'
			else
				redirect_to root_path, :notice => 'You are not supposed to view this page.'
		end
	end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
		redirect_to root_path
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])
		@cart.user = current_user

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
#    @cart.movie_items.destroy_all
#		@cart.episode_items.destroy_all
		@cart.update_attribute :discount, 0

    respond_to do |format|
			format.html { redirect_to(root_path, :notice => 'Your cart is currently empty.') }
      format.json { head :ok }
    end
  end
end
