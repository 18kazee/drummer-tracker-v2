# frozen_string_literal: true

class DrummerGenre < ApplicationRecord
  belongs_to :drummer
  belongs_to :genre
end
