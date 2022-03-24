class FeedbackMailer < ApplicationMailer
  def send_feedback(subject, text)
    @email = subject
    @text = text

    mail to: "filin-i@yandex.ru", from: "feedback@rubyman-tg.herokuapp.com/"
  end
end
