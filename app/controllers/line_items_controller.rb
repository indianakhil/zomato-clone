class LineItemsController < ApplicationController



    def create
        @order = current_order
        @line_item = @order.line_items.new(order_params)
        @order.save

        session[:order_id] = @order.id
    end

    def update
        @order = current_order
        @line_item = @order.line_items.find(params[:id])
        # @line_item.update(:product_id=> params[:product_id], :quantity=> params[:quantity])
        @line_item.update(order_params)
        @line_items = current_order.line_items

    end

    def destroy
        @order = current_order
        @line_item = @order.line_items.find(params[:id])
        # @line_item.update(:product_id=> params[:product_id], :quantity=> params[:quantity])
        @line_item.destroy
        @line_items = current_order.line_items
        redirect_to carts_path

    end


    private

    def order_params
        params.require(:line_item).permit(:product_id, :quantity)
    end

end
