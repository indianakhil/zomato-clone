class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    # @products = Product.all
    # @line_item = current_order.line_items.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # @product = Product.find(params[:id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to root_path
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :open_time, :close_time, :location, :user_id)
  end


end
