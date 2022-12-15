class Favorite < ApplicationRecord
  # associations
  belongs_to :user, counter_cache: true
  belongs_to :album, counter_cache: true

  # validations
  validates :user_id, presence: true
  validates :album_id, presence: true
  

  def self.check_exist(user_id, album_id)
    where(user_id:, album_id:).exists?
  end
end
