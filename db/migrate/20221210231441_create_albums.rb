class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name,null: false
      t.text :description,null: false
      t.date :release_date,null: false
      t.string :artist,null: false

      t.timestamps
    end
  end
end
