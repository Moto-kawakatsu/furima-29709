class OrdersController < ApplicationController
    def index
         @item = Item.find(params[:item_id])
         @order = Order.new
    end

    def create
        # @order = Order.new(order_params)
        @order = PayForm.new()order_params
        if @order.valid?
            pay_item
            @order.save
            return redirect_to root_path
        else
            render 'index'
        end
    end

    private
    
    def order_params
        params.require(:order).permit(:price).merge(token: params[:token])
        # params.require(:order).permit(:price, :item_id, :token).merge(item_id:@item.id)
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
        Payjp::Charge.create(
          amount: order_params[:price],  # 商品の値段
          card: order_params[:token],    # カードトークン
          currency:'jpy'                 # 通貨の種類(日本円)
        )
      end
end
