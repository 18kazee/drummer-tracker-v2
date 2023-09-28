class Artist < ApplicationRecord
  has_many :drummer_artists, dependent: :destroy
  has_many :drummers, through: :drummer_artists

  def self.ransackable_attributes(auth_object = nil)
    %w(album_image album_url created_at id name spotify_id spotify_name updated_at)
  end
end
