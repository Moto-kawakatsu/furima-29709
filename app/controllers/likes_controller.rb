class LikesController < ApplicationController
  # before_action :set_like, only: [:show]

    def show
      # @items = Item.all.order("created_at DESC")
      # @like = current_user.likes.find_by(item_id: item.id)

      @likes = current_user.likes.order("created_at DESC")
      # @items.each do |item|
        # if item.likes.includes(:user).present?
          # item.image
        # end
      # end
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

#   def set_like
#     @like = Like.find(params[:id])
# end

end

