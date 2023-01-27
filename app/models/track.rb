class Track < ApplicationRecord
  # Associations
  belongs_to :album, counter_cache: true

  # Validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :time, presence: true, numericality: { only_integer: true }
  validates :album_id, presence: true
  validates :album_id, presence: true

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
