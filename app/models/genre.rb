class Genre < ApplicationRecord
  has_many :drummer_genres, dependent: :destroy
  has_many :drummers, through: :drummer_genres
end
