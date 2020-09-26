class ItemsController < ApplicationController
    before_action :move_to_index, except: [:index, :show]


    # itemテーブルの全てのレコードを@itemsに代入した
    def index
        @items = Item.all
    end
    
    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)

    end



    private

    def item_params
        params.require(:item).permit(
            :user,
            :name,
            :description,
            :category_id,
            :condition_id
            :shipping_fee_id
            :ship_from_address_id
            :shipping_days_id
            :price
        ).merge(
            user_id: current_user.id,
        )
    end
    
    def move_to_index
        unless user_signed_in?
          redirect_to action: :index
        end
      end

end
