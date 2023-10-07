# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :drummer
  has_many :comments, dependent: :destroy

  validates :tweet, presence: true
end
