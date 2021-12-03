class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @products = @restaurant.products
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
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
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
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :veg_nveg, :category, :portion, :image, :restaurant_id)
    end
end
