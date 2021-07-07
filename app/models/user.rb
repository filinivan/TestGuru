class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :username, presence: true

  def tests_with_level(level_num)
    tests.where(level: level_num)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
