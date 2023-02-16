class ArtworksIndexes < ActiveRecord::Migration[7.0]
  def change
    drop_table :artworks

    create_table :artworks do |t|

      t.string :title, null: false
      t.string :image_url, null: false, index: {unique: true}
      t.integer :artist_id, null: false

      t.timestamps
    end

    add_foreign_key :artworks, :users, column: :artist_id
    add_index :artworks, [:title, :artist_id], unique: true


  end
end
