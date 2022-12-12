class TrackController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def create
    @album = current_user.albums.find_by_id(params[:album_id])
    @track = @album.tracks.create(track_params)
    redirect_to album_path(@album)
  end

  def destroy
    @album = current_user.albums.find_by_id(delete_params[:album_id])
    @track = @album.tracks.find_by_id(delete_params[:track_id])
    @track.destroy
    redirect_to album_path(@album)
  end

  private

  def track_params
    params.require(:track).permit(:name, :time, :spotify_link, :album_id)
  end

  def delete_params
    params.permit(:album_id, :track_id)
  end


end
