class Test < ApplicationRecord
  belongs_to :category
  has_many :passed_tests
  has_many :users, through: :passed_tests

  def self.test_names(category_name)
    Test.joins(:category).where('categories.name = ?', category_name).order('title DESC').select(:title)
  end
end
