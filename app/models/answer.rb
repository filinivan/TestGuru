class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :limit_of_answers, on: :create

  scope :right_answers, -> { where(correct: true) }

private

def limit_of_answers
  errors.add(:answer) if question.answers.count >= 4
end

end
