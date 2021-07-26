class AnswersController < ApplicationController


  def show
  end

  private

    def find_question
      @question = Question.find(params[:question_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end
