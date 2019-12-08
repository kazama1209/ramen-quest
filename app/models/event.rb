class Event < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true
  validates :start_time, presence: true

  belongs_to :user
end
