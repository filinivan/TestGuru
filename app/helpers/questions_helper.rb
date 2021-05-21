module QuestionsHelper
  
  def question_header(question)
    if question.persisted?
      text = "Edit " + @question.test.title + " Question"
    else 
      text = "Create New " + @question.test.title = " Question"
    end
    return text
  end
  
end
