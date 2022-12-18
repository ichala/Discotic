class SearchController < ApplicationController
  def index
    @albums = Album.search_albums(params)
    @tracks = Track.search_tracks(params)
    @artists = Album.search_artists(params)
  end
end
