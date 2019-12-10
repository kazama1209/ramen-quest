class Inquiry < ApplicationRecord
  has_many :notifications, dependent: :destroy

  validates :email, presence: true, email: true
  validates :name, presence: true
  validates :kana, presence: true
  validates :content, presence: true

  def give_notification
    Notification.create(inquiry_id: id, action: '問い合わせ')
  end
end
