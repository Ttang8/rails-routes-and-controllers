class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.user_artwork(params[:id])
    # @artwork = Artwork.all

    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 400
    end
  end

  def show
    @artwork = selected_artwork

    if @artwork
      render json: @artwork
    else
      render json: ["Cannot find artwork!"], status: 404
    end
  end

  def update
    @artwork = selected_artwork

    if @artwork.update_attributes(artwork_params)
      render json: @artwork
    else
      render json: @artwork.error.full_messages, status: 400
    end
  end

  def destroy
    @artwork = selected_artwork

    if @artwork
      @artwork.destroy
      render json: @artwork
    else
      render json: ["Cannot delete artwork!"], status: 404
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

  def selected_artwork
    Artwork.find_by(id: params[:id])
  end
end
