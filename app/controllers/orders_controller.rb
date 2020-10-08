class OrdersController < ApplicationController
    def index
         @item = Item.find(params[:item_id])
         @order = Buy.new
    end

    def new
        @order = Buy.new
    end

    def create
        @item = Item.find(params[:item_id])
        @order = Buy.new(order_params)
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
        params.require(:buy).permit(
            :postal_code, 
            :prefecture_id, 
            :city,:detail_address, 
            :building_name, 
            :phone_number,
            :order_id
        ).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
    end

    def pay_item
        @item = Item.find(params[:item_id])
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
        Payjp::Charge.create(
          amount: @item[:price],  # 商品の値段
          card: order_params[:token],    # カードトークン
          currency:'jpy'                 # 通貨の種類(日本円)
        )
      end
end
