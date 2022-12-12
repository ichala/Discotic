class AddTrackCountToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :tracks_count, :integer
  end
end
