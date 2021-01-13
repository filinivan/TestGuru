class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]

  
  def test_questions
    @questions = @test.questions
  end

  def test_question
    @questions = @test.questions.find(params[:id])
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save 
      render 'Success'
    else 
      render 'Error'
    end
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
