class AddImageDataToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :image_data, :text  
  end
end
