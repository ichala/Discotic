class Album < ApplicationRecord
  belongs_to :user, counter_cache: true
  include ImageUploader::Attachment(:image)
end
