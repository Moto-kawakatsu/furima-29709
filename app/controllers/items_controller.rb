class ItemsController < ApplicationController
    before_action :move_to_index, except: [:index, :show]

    def index
    end
    
    def new
         @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        
    end

    def edit
    end



    private

    def item_params
        params.require(:item).permit(
            :user,
            :name,
            :description,
            :category_id,
            :condition_id,
            :shipping_fee_id,
            :ship_from_address_id,
            :shipping_days_id,
            :price
            )
    end
    
end