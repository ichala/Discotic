class ExploreController < ApplicationController

  def index
    @filters = Album.get_filters
    @albums = Album.all.paginate(page: params[:page], per_page: 8)
    filtering_params(params).each do |key, value|
    @albums = Album.public_send("filter_by_#{key}", value).paginate(page: params[:page], per_page: 8) if value.present?
  end
  p @filters
  end

  def filtering_params(params)
    params.slice(:genre, :format, :year, :style)
  end
end
