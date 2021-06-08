class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true 

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def complited?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end
    save!
  end

  def success?
    return true if self.correct_question / self.test.questions.count >= 0.85
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    # byebug
    # correct_answers_count = correct_answers.count

    # correct_answers_count == correct_answers.where(id: answer_ids).count &&
    # correct_answers_count == answer_ids.count
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def result?
    self.current_question.id 
  end

  


end
