class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :find_question, only: %i[show destroy edit update]

  def edit
  end

  def index
    find_test
    @questions = @test.questions
  end

  def new
    find_test
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save 
      render html: 'Success'
    else 
      render html: 'Error'
    end
  end

  def destroy 
    @question.destroy

    redirect_to @test
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Ресурс не найден.'
  end
end
