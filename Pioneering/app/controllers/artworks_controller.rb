class ArtworksController < ApplicationController

    def index
        
        # @artworks = Artwork.all
        @user_art = User.find(params[:id]).artworks
        @shared_art = User.find(params[:id]).shared_artworks
        render json: @user_art.concat(@shared_art)

        # render json: "Hello, you're on rails!"
    end

    def create

        # render json: params
        @artwork = Artwork.new(art_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def show
        @artwork = Artwork.find(params[:id])
        if @artwork
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    def update
        
        @artwork = Artwork.find(params[:id])
        if @artwork.update(art_params)
            redirect_to users_url(@artwork.id)

        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity

        end

    end

    def destroy

        @artwork = Artwork.find(params[:id])
        if @artwork.destroy
            redirect_to users_url
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    
    private
    def art_params
        params.require(:artwork).permit(:title, :img_url, :artist_id)
    end


end