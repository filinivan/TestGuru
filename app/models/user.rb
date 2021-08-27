
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable

  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, if: Proc.new { |u| u.encrypted_password.blank? }
  validates :password, confirmation: true

  def tests_with_level(level_num)
    tests.where(level: level_num)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    type == 'Admin'
  end

end
