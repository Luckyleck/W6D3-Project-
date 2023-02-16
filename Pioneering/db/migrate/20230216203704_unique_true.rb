class UniqueTrue < ActiveRecord::Migration[7.0]
  def change
    remove_index :artwork_shares, [:artwork_id, :viewer_id]
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
  end
end
