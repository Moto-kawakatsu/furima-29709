class ItemsController < ApplicationController
        before_action :authenticate_user!, except: [:index, :show]
      
        def index
            @items = Item.order("created_at DESC")
        end
        
        def new
            @item = Item.new
        end
    
        def create
            @item = Item.new(item_params)
            if @items.save
                redirect_to root_path
            else
                render :new
            end
        end
    
        # def show 
        #     @items = Items.includes(:item_images).order('created_at DESC').find(params[:id])
        # end
        
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
                :price,
                :image
            ).merge(user_id: current_user.id)
        end    
    end