# frozen_string_literal: true

class DrummerArtist < ApplicationRecord
  belongs_to :drummer
  belongs_to :artist
end
