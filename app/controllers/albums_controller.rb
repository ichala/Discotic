class AlbumsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: %i[new create]

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    if @album.save
      redirect_to root_path
    else
      redirect_to new_album_path, error: @album.errors.full_messages
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :description, :artist, :release_date, :image)
  end
end
