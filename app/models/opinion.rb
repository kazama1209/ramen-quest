class Opinion < ApplicationRecord
  validates :content, presence: true
end
