class Notification < ApplicationRecord
  belongs_to :inquiry, optional: true
end
