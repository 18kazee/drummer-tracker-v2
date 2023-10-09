# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true, length: { maximum: 655 }

  broadcasts_to ->(_comment) { 'comments' }, inserts_by: :prepend
end
