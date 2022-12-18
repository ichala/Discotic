class AddAlbumsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :albums_count, :integer
  end
end
