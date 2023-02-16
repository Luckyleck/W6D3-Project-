# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord

    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness: { scope: :artist_id }
    validates :image_url, uniqueness: true

    belongs_to :artist,
        class_name: :User,
        primary_key: :id,
        foreign_key: :artist_id

end
