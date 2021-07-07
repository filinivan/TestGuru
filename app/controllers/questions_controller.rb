class QuestionsController < ApplicationController

  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :find_question, only: %i[show destroy edit update]
  before_action :find_test, only: %i[create new index]

  def edit
  end

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save 
      redirect_to @test
    else 
      render html: 'Error'
    end
  end

  def destroy 
    @question.destroy

    redirect_to @question.test
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
