# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :drummer
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :tweet, presence: true
  validates :drummer_id, presence: true
  validates :user_id, presence: true
end
