class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  enum category: { 未選択: 0, 割引キャンペーン: 1, 新店オープン: 2 }

  mount_uploader :image, ImageUploader
end
