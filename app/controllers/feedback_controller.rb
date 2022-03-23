class FeedbackController < ApplicationController
  def new
  end

  def create
    subject = current_user.email
    text = params[:text]
    FeedbackMailer.send_feedback(subject, text).deliver_now
    redirect_to new_feedback_path, notice: "Success!"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:text)
  end
end
