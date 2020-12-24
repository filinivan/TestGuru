class Test < ApplicationRecord
  belongs_to :category
  has_many :passed_tests
  has_many :users, through: :passed_tests
  has_many :questions
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :level, uniqueness: true
  # validate :validate_max_level
  validates :title, uniqueness: true

  scope :simple_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) } 
  scope :hard_level, -> { where(level: 5..Float::INFINITY) } 

  scope :by_category, -> (category_name) { Test.joins(:category).where('categories.name = ?', category_name).order('title DESC') } 

  def self.category_by_title(category_name)
    Test.by_category(category_name).pluck(:title)
  end

end
