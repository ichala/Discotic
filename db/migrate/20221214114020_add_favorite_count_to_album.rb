class AddFavoriteCountToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :favorites_count, :integer, default: 0
    add_column :users, :favorites_count, :integer, default: 0
  end
end
