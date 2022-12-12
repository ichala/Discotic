class Album < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :tracks, dependent: :delete_all

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
end
