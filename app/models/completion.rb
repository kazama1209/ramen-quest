class Completion < ApplicationRecord
  validates :user_id, presence: true
  validates :ramen_shop_id, presence: true

  belongs_to :user
  belongs_to :ramen_shop
end
