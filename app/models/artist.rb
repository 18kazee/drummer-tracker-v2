class Artist < ApplicationRecord
  has_many :drummer_artists, dependent: :destroy
  has_many :drummers, through: :drummer_artists
end
