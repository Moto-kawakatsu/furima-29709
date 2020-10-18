class LikesController < ApplicationController
    def index
      @like_items = current_user.like_items
    end
  
    def create
      @like = current_user.likes.create(item_id: params[:item_id])
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
        @item = Item.find(params[:item_id])
        @like = current_user.likes.find_by(item_id: @item.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
    end
  end