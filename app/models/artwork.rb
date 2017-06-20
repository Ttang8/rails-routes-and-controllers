# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true, uniqueness: true
  validates :artist_id, presence: true, uniqueness: { scope: :title,
    message: "good artists don't use same title for their art!"}

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :viewer

  def self.user_artwork(id)
    Artwork
      .joins('artwork_shares ON artwork_shares.artwork_id = artwork.id')
      .where('artworks.artist_id = ? OR artwork_shares.viewer_id = ?', id, id)

  end
end
