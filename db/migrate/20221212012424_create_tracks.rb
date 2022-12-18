class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :time
      t.string :spotify_link

      t.timestamps
    end
  end
end
