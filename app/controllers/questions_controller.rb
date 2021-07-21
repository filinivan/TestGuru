class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :find_question, only: %i[show]

  def index
    @questions = @test.questions
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Ресурс не найден.'
  end
end
