class ItemsController < ApplicationController
        before_action :authenticate_user!, except: [:index, :show]
        before_action :set_item, only: [:show, :edit, :update, :destroy]
       
        def index
            @items = Item.all.order("created_at DESC")
        end
        
        def new
            @item = Item.new
        end
    
        def create
            @item = Item.new(item_params)
            if @item.save
                redirect_to root_path
            else
                render :new
            end
        end

        def update
            if @item.update(item_params)
                redirect_to item_path
            else
                render :edit
            end
        end

        def destroy
            if @item.destroy
               redirect_to root_path
            else
                render :show
            end
               
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
                :price,
                :image
            ).merge(user_id: current_user.id)
        end    

        def set_item
            @item = Item.find(params[:id])
        end



    end