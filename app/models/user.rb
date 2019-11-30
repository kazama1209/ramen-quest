class User < ApplicationRecord
  has_many :chat_messages
  has_many :chat_room_users
  has_many :authentications, dependent: :destroy

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  mount_uploader :image, ImageUploader

  validates :password, presence: true, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, email: true, uniqueness: true, confirmation: true
end
