class ArtworkSharesController < ApplicationController
  def create
    @artworkshare = Artwork.new(artworkshare_params)

    if @artworkshare.save
      render json: @artworkshare
    else
      render json: @artworkshare.errors.full_messages, status: 400
    end
  end

  def destroy
    @artworkshare = selected_artworkshare

    if @artworkshare
      @artworkshare.destroy
      render json: @artworkshare
    else
      render json: ["Cannot delete artworkshare!"], status: 404
    end
  end

  private

  def artworkshare_params
    params.require(:artworkshare).permit(:artwork_id, :viewer_id)
  end

  def selected_artworkshare
    ArtworkShare.find_by(id: params[:id])
  end
end
