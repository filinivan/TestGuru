class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question
  before_update :before_update_test_passed

  scope :passed, -> { where(passed: true) }

  SUCCESS_PERCENT_NUMBER = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end
    save!
  end

  def success?
    success_percent >= SUCCESS_PERCENT_NUMBER
  end

  def time_left?
    self.updated_at + self.test.time < Time.now
  end

  def time_end
    @time_end = self.updated_at + self.test.time - Time.now
  end

  def success_percent
    self.correct_question.to_f / self.test.questions.count * 100.0
  end

  def percent
    self.current_question_number.to_f / self.test.questions.count * 100
  end

  def current_question_number
    self.test.questions.index(current_question) + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_update_test_passed
    self.passed = true if success? && completed?
  end

end
