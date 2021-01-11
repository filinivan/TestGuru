class QuestionsController < ApplicationController
  def questions_list 
    render json: {questions = Test.questions}
  end
end
