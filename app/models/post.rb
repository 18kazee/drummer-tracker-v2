# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :drummer

  validates :tweet, presence: true
end
