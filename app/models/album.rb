class Album < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :tracks, dependent: :delete_all
  has_many :favorites, dependent: :delete_all
  scope :filter_by_genre, ->(genre) { where(genre:) }
  scope :filter_by_style, ->(style) { where(style:) }
  scope :filter_by_format, ->(format) { where(format:) }
  scope :filter_by_year, ->(year) { where('extract(year from release_date) = ?', year) }

  has_one_attached :image_data

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

  def self.trends
    @trends = []
    generate_trends.each do |single|
      @trends << { score: ((single[0] / 2) + single[1]), name: single[2], id: single[3],
                   image: ActiveSupport::JSON.decode(single[4]) }
    end
    @trends
  end

  def self.trends_pos(id)
    @rank = 0
    generate_trends.each_with_index do |single, index|
      @rank = index + 1 if single[3] == id
    end
    @rank
  end

  def self.generate_trends
    pluck(:views, :searches, :name, :id, :image_data).sort_by do |views, searches|
      (views / 2) + searches
    end.reverse.first(6)
  end

  def self.recently_added
    order('created_at DESC').limit(6)
  end
end
