class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @products = @restaurant.products


    @res_products = params[:tag] ? @products.tagged_with(params[:tag]) : @products
    @tags = Tag.all
    

    @line_item = current_order.line_items.new
  end

  # GET /products/1 or /products/1.json
  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.find(params[:id])
  end

  # GET /products/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.new
  end

  # GET /products/1/edit
  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.find(params[:id])
  end

  # POST /products or /products.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.create(product_params)

      if @product.save
          redirect_to restaurant_path(@restaurant)
      else
        render :new
      end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
      if @product.update(product_params)
        redirect_to restaurant_product_path
      else  
        render :edit
      end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @product = @restaurant.products.find(params[:id])
    # @product = Product.find(params[:id])
    @product.destroy
    # @products = @restaurant.products
    # redirect_to restaurant_path(@restaurant)

    respond_to do |format|
      format.html { redirect_to restaurant_products_path(restaurant) }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end



  def search
    @restaurant = Restaurant.find(params[:restaurant_id])
    @products = @restaurant.products
    @line_item = current_order.line_items.new

    if params[:search].blank?
      redirect_to restaurant_products_path and return
    else
      @parameter = params[:search].downcase
      @results = @products.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end

  end


def product_search
     @restaurant = Restaurant.find(params[:restaurant_id])
    @products = @restaurant.products
    @line_item = current_order.line_items.new

    if params[:productsearch].blank?
      redirect_to restaurant_products_path and return
    else
      @parameter = params[:productsearch].downcase
      @results = @products.where("lower(tags) LIKE :productsearch", productsearch: "%#{@parameter}%")
    end

end


  private
    def set_product
      @restaurant = Restaurant.find(params[:restaurant_id])
      @product = @restaurant.products.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :veg_nveg, :category, :portion, :restaurant_id, :search, :image, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
    end
end
