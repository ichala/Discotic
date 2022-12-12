class AddAlbumRefToTrack < ActiveRecord::Migration[7.0]
  def change
    add_reference :tracks, :album, null: false, foreign_key: true
  end
end
