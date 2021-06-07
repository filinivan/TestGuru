class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true 

  before_validation :before_validation_set_first_question, on: :create
  # before_update :after_update_validation_next_question


  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_update_validation_next_question
    self.current_question = test.questions.order("id ASC").where(id > current_question.id).first
  end


end
