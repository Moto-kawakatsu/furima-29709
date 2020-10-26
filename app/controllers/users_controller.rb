class UsersController < ApplicationController
    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if current_user.save
            redirect_to root_path
        else
            render :new
        end
    end


    def edit
    end

    def update
        if current_user.update(user_params)
           redirect_to root_path 
        else
            render :edit 
        end
    end

    private

 def user_params
        params.require(:user).permit(
            :nickname,
            :email,
            :password,
            :password_confirm,
            :family_name_kanji,
            :fisrt_name_kanji,
            :family_name_kana,
            :first_name_kana,
            :birthday
        )
    end
end