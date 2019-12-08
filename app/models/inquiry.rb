class Inquiry < ApplicationRecord
  validates :email, presence: true, email: true
  validates :name, presence: true
  validates :kana, presence: true
  validates :content, presence: true
end
