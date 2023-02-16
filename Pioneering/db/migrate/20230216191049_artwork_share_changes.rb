class ArtworkShareChanges < ActiveRecord::Migration[7.0]
  def change

    drop_table :artwork_shares

    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false,index: { unique: true }
      t.integer :viewer_id, null: false,index: { unique: true }

      t.timestamps
    end

    add_foreign_key :artwork_shares, :artworks, column: :artwork_id
    add_foreign_key :artwork_shares, :users, column: :viewer_id
  end
end
