class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true 

  before_validation :before_validation_set_first_question, on: :create
  after_update_validation :after_update_validation_next_question, on: :update


  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_update_validation_next_question
    self.current_question = test.questions.find(self.current_question.id + 1) if test.present?
  end


end
