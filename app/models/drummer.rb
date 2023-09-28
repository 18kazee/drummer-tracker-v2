class Drummer < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true

  enum country: {japan: 0, abroad: 1}
end
