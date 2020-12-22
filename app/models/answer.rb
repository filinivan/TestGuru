class Answer < ApplicationRecord
  belongs_to :question
  validates  :body, presence: true
  validate :limit_of_answers, on: :create

  scope :right_answers, -> { where(correct: true) }
end

private

def limit_of_answers
    errors.add(:answer) if Answer.where(question_id: question_id).length > 4
end
