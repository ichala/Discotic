class AlbumsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:show]

  def new
    @album = Album.new
  end

  def edit
    @album = current_user.albums.find_by_id(params[:id])
    if @album.nil?
      redirect_to my_albums_url(1), error: 'Album not found, or not enough permissions'
    else
      render :edit
    end
  end

  def show
    @album = Album.find_by_id(params[:id])
    @track = Track.new
    @track_list = @album.tracks.order(created_at: :desc)
    if @album.nil?
      redirect_to my_albums_url(1), error: 'Album not found'
    else
      @album.increment!(:searches) if params[:search]
      @album.increment!(:views)
      render :show
    end
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    if @album.save
      redirect_to my_albums_url(1), success: "#{@album.name} Album Created !"
    else
      redirect_to new_album_path, error: @album.errors.full_messages
    end
  end

  def myalbums
    @albums = current_user.albums.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @album = current_user.albums.find(params[:id])
    if @album.destroy
      redirect_to my_albums_url(1), success: 'Album deleted'
    else
      redirect_to my_albums_url(1), error: "Couldn't delete album"
    end
  end

  def update
    @album = current_user.albums.find(params[:id])
    if @album.update(album_params)
      redirect_to my_albums_url(1), success: 'Album updated'
    else
      redirect_to my_albums_url(1), error: "Couldn't update album"
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :description, :artist, :release_date, :image)
  end
end
