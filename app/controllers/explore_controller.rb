class ExploreController < ApplicationController
  def index
    @filters = Album.generate_filters
    @albums = Album.all.paginate(page: params[:page], per_page: 8)
    filtering_params(params).each do |key, value|
      if value.present?
        @albums = Album.public_send("filter_by_#{key}", value).paginate(page: params[:page],
                                                                        per_page: 8)
      end
    end
    p @filters
  end

  def trends
    @trends = Album.trends
  end

  def filtering_params(params)
    params.slice(:genre, :format, :year, :style)
  end
end
