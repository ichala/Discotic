class Album < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :tracks, dependent: :delete_all

  include ImageUploader::Attachment(:image)
end
