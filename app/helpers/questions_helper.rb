module QuestionsHelper
  
  def question_header(question)
    question = question.nil? ? Question.new : question
    if question.persisted?
      "Edit #{ question.test.title } Question"
    else 
      "Create New #{ @test.title } Question"
    end
  end
  
end
