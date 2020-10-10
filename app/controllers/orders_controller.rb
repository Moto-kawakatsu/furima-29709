class OrdersController < ApplicationController
before_action :set_item, only: [:index, :create]
before_action :authenticate_user!, except: [:show]
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
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item[:price], 
          card: order_params[:token],   
          currency:'jpy'               
        )
      end

end
