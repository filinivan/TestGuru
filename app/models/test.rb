class Test < ApplicationRecord
  belongs_to :category
  has_many :passed_tests
  has_many :users, through: :passed_tests
  has_many :questions
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  scope :simple_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) } 
  scope :hard_level, -> { where(level: 5..Float::INFINITY) } 

  scope :test_names, ->(category_name) { Test.joins(:category).where('categories.name = ?', category_name).order('title DESC').pluck(:title) } 

  # def self.test_names(category_name)
  #   Test.joins(:category).where('categories.name = ?', category_name).order('title DESC').pluck(:title)
  # end
end
