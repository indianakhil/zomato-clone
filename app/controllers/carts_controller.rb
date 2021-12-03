class CartsController < ApplicationController
  def show
    @line_items = current_order.line_items
  end
  def checkout
    @line_items = current_order.line_items
    render 'carts/final_checkout'
  end
end
