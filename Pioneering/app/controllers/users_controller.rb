class UsersController < ApplicationController

    def index
        

        render json: "Hello, you're on rails!"
    end

    def create

        render json: params
        
    end

    def show

        render json: params

    end


end