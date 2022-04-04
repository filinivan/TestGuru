class Badge < ApplicationRecord
  validates :title, presence: true
  validates :img, presence: true
end
