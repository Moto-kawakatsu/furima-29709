class OrdersController < ApplicationController
before_action :set_item, only: [:index, :create]
before_action :authenticate_user!, except: [:index, :show]
    def index
         @order = Buy.new
         item = Item.find(params[:item_id])
         if item.order.present?
             redirect_to root_path 
         elsif item.user == current_user
            redirect_to root_path
         end
    end

    def create
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
    
    def set_item
        @item = Item.find(params[:item_id])

    end

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
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
        Payjp::Charge.create(
          amount: @item[:price],  # 商品の値段
          card: order_params[:token],    # カードトークン
          currency:'jpy'                 # 通貨の種類(日本円)
        )
      end

end
