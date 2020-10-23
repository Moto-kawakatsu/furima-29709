class LikesController < ApplicationController
    
    def show
      @likes = current_user.likes.order("created_at DESC")
    end

    def pop_item
      @ids = Like.group(:item_id).count(:item_id)
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

  private

  def like_params
    params.require(:like).permit(
        :item_id, 
        :user_id, 
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

