# frozen_string_literal: true

class User < ApplicationRecord
  before_create :generate_activation_token, unless: :guest?
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, on: :create
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 5 }, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, on: :create
  validates :profile, length: { maximum: 200 }, on: :update

  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  def send_activation_needed_email
    return if guest? # ゲストユーザーでない場合かつ未保存の場合にメールを送信

    UserMailer.activation_needed_email(self).deliver_now
  end

  def generate_activation_token
    self.activation_token = SecureRandom.hex(32)
  end
end
