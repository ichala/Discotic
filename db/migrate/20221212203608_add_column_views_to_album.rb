class AddColumnViewsToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :views, :integer , default: 0
  end
end
