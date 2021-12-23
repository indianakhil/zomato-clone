class TagsController < ApplicationController



def index
	@restaurant = Restaurant.find(params[:restaurant_id])
	@products = @restaurant.products
	@tags = Tag.all

end

def show
	@tags = Tag.all
	# @restaurant = Restaurant.find(params[:restaurant_id])
    # @tag_products = params[:tag] ? @products.tagged_with(params[:tag]) : @products
    @tag = Tag.find(params[:id])
    @t_products = @tag.products
    # @tag_products = @t_products.where(restaurant_id: @restaurant.id)

end


end
