class Badge < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :img, presence: true
end
