class Album < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :tracks, dependent: :delete_all
  scope :filter_by_genre, ->(genre) { where(genre:) }
  scope :filter_by_style, ->(style) { where(style:) }
  scope :filter_by_format, ->(format) { where(format:) }
  scope :filter_by_year, ->(year) { where('extract(year from release_date) = ?', year) }

  include ImageUploader::Attachment(:image)

  def self.search_albums(params)
    if params[:query].blank?
      []
    else
      where(
        'lower(name) LIKE :query OR lower(description) LIKE :query', query: "%#{params[:query].downcase}%"
      )
    end
  end

  def self.search_artists(params)
    if params[:query].blank?
      []
    else
      where(
        'lower(artist) LIKE :query', query: "%#{params[:query].downcase}%"
      )
    end
  end

  def self.generate_filters
    {
      all: all.count,
      genre: group(:genre).count,
      format: group(:format).count,
      style: group(:style).count,
      year: group("TO_CHAR(release_date, 'YYYY')").count
    }
  end
end
