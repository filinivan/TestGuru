class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }, presence: true

  scope :level, ->(level) { where(level: level) }
  scope :simple_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :active_test, -> { where(active: true).all }

  scope :by_category, -> (category_name) { joins(:category).where('categories.name = ?', category_name) }

  def self.category_by_title(category_name)
    by_category(category_name).order('title DESC').pluck(:title)
  end

end
