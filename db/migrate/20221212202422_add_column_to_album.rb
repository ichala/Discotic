class AddColumnToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :searches, :integer , default: 0
  end
end
