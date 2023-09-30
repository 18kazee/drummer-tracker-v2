# frozen_string_literal: true

class Drummer < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true

  enum country: { japan: 0, abroad: 1 }

  has_many :drummer_artists, dependent: :destroy
  has_many :artists, through: :drummer_artists
  has_many :drummer_genres, dependent: :destroy
  has_many :genres, through: :drummer_genres

  def self.ransackable_attributes(_auth_object = nil)
    %w[country created_at discogs_id id image_urls name profile updated_at youtube_videos]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[artists drummer_artists drummer_genres genres]
  end
end
