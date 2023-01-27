class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.timestamps
    end
    add_reference :favorites, :album, null: false, foreign_key: true
    add_reference :favorites, :user, null: false, foreign_key: true
  end
end
