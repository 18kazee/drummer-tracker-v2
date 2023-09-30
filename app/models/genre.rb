# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :drummer_genres, dependent: :destroy
  has_many :drummers, through: :drummer_genres

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end
end
