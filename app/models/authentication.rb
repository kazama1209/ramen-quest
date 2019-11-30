class Authentication < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :provider, uniqueness: { scope: :uid }
end
