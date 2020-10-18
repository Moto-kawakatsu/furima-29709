class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        @item = Item.find(params[:item_id])
        @comments = @item.comments.includes(:user).limit(5).order("created_at DESC")
        @comment = Comment.new
        @comment = Comment.new(comment_params)
        if @comment.save
           redirect_to item_path(@item)
        else
           render template: "items/show"
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @item = @comment.item
        if @comment.destroy
           redirect_to item_path(@item)
        else
            render :show
        end       
    end

    private
    def comment_params
        params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
    end
end


