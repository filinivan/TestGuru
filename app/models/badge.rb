class Badge < ApplicationRecord
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  validates :title, presence: true
  validates :img, presence: true
end
