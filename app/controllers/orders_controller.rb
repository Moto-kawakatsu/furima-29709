class OrdersController < ApplicationController
    def index
    #    @order = Order.find_by_id(params[:id])
         @item = Item.find(params[:item_id])
    end

    def create
        # if @order.save
        #     redirect_to item_orders_path
        # else 
        #     render :new
        # end
    end


    private
    
    def order_params
        params.require(:order).permit(:price, :item_id).merge(item_id:@item.id)
    end
end
