class UniqueTrue < ActiveRecord::Migration[7.0]
  def change
    remove_index :artwork_shares, :index_artwork_shares_on_artwork_id_and_viewer_id

    add_index :artwork_shares, :index_artwork_shares_on_artwork_id_and_viewer_id, unique: true
  end
end
