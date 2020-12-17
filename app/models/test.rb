class Test < ApplicationRecord
  belongs_to :category
  has_many :passed_tests
  has_many :users, through: :passed_tests
  has_many :questions
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  def self.test_names(category_name)
    Test.joins(:category).where('categories.name = ?', category_name).order('title DESC').pluck(:title)
  end
end
