class AddFiltersColumnToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :genre, :string, default: "Rock"
    add_column :albums, :format, :string, default: "CD"
    add_column :albums, :style, :string, default: "Pop"
  end
end
