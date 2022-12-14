class Favorite < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :album, counter_cache: true

  def self.check_exist(user_id, album_id)
    where(user_id:, album_id:).exists?
  end
end
