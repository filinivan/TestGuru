require 'digest/sha1'

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

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string + salt)
  end
end
