class Track < ApplicationRecord
  belongs_to :album, counter_cache: true

  def self.search_tracks(params)
    # get 4 recent articles if no query is present or get articles that match the query
    if params[:query].blank?
      []
    else
      group(:id, :name).where(
        'lower(name) LIKE :query', query: "%#{params[:query].downcase}%"
      )
    end
  end
end
