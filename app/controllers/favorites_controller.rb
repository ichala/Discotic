class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = Album.joins(:favorites).where(favorites: { user_id: current_user.id })
      .order(created_at: :desc).paginate(
        page: params[:page], per_page: 8
      )
  end

  def create
    if Favorite.check_exist(current_user.id, params[:album_id])
      redirect_to album_path(params[:album_id])
    else
      @favorite = Favorite.new
      @favorite.user = current_user
      @favorite.album = Album.find(params[:album_id])
      @favorite.save
      redirect_to album_path(@favorite.album)
    end
  end

  def destroy
    @favorite = Favorite.where(album_id: params[:album_id], user_id: current_user.id).first
    @favorite&.destroy!
    redirect_back(fallback_location: root_path)
  end

  private

  def favorite_params
    params.require(:album_id).permit(:album_id)
  end
end
