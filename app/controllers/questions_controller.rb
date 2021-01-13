class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]
  
  def index 
    @questions = Question.all
  end

  def test_question
    @questions = @test.questions.find(params[:id])
  end

  def new
    render file: 'public/new_question', layout: false
  end

  def create
    @question = @test.questions.new(question_params)
    @question.save 
  end

  def destroy 
    @question.destroy
  end

  private

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
