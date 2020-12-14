class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def tests_with_level(level_num)
    tests.where(level: level_num)
  end
end
