class Drummer < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true

  enum country: {japan: 0, abroad: 1}

  has_many :drummer_artists, dependent: :destroy
  has_many :artists, through: :drummer_artists
end
