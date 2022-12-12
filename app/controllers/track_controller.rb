class TrackController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def create
    @album = Album.find_by_id(params[:album_id])
    @track = @album.tracks.create(track_params)
    redirect_to album_path(@album)
  end

  private
  def track_params
    params.require(:track).permit(:name, :time, :spotify_link, :album_id )
  end
end
