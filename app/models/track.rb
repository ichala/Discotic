class Track < ApplicationRecord
  belongs_to :album, counter_cache: true
end
