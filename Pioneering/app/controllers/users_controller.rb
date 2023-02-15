class UsersController < ApplicationController

    def index
        
        @users = User.all
        render json: @users
        # render json: "Hello, you're on rails!"
    end

    def create

        # render json: params
        @user = User.new(strong_params)
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def show
        @user = User.find(params[:id])
        if @user
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end

    end

    def strong_params
        params.require(:user).permit(:name, :email)
    end

    def update
        
        @user = User.find(params[:id])
        if @user.update(strong_params)
            redirect_to users_url(@user.id)

        else
            render json: @user.errors.full_messages, status: :unprocessable_entity

        end

    end


end