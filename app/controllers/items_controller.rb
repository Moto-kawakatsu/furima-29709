class ItemsController < ApplicationController
        before_action :authenticate_user!, except: [:index, :show]
        before_action :set_item, only: [:show, :edit, :update, :destroy]
        before_action :search_item, only: [:search, :result]

        def index
            @items = Item.all.order("created_at DESC").limit(8)
        end
        
        def show
           @comment = Comment.new
           @comments = @item.comments.includes(:user).limit(5).order("created_at DESC")
        end

        def search
            @items = Item.all.order("created_at DESC")
            set_item_column

            # params[:q] = { price_eq: 1000 }    if params[:price] == 1000
            # params[:q] = { price_lteq: 2500 }  if params[:price] == 2500
            # params[:q] = { price_lteq: 5000 }  if params[:price] == 5000
            # params[:q] = { price_gt: 5000 } if params[:price] == 5000
            # @search = Item.ransack(params[:q])
            # @result = @search.result(distinct: true)
        end

        def result
            @result = []
            @results = @p.result.order("created_at DESC")
            @results.each do |result|
                if result.order == nil
                    @result << result
                end
            end
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

        def search_item
            @p = Item.ransack(params[:q])
        end

        def set_item_column
            @item_name = Item.select("name").distinct #重複なくnameカラムのデータを取り出す
            selected_items = Item.select("category_id").distinct
            @item_category = []
            selected_items.each do |item|
                @item_category << Category.find(item.category_id)
            end
            @item_price = Item.select("price").distinct
        end
    end