class User < ApplicationRecord
  has_many :authentications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :completions, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  validates :password, presence: true, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, email: true, uniqueness: true, confirmation: true

  enum role: { user: 0, admin: 200 }

  mount_uploader :image, ImageUploader
end
