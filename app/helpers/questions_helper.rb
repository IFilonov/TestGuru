module QuestionsHelper
  def question_header(question)
    title = question.test.title.capitalize
    if question.new_record?
      "Create New #{title} Question"
    else
      "Edit #{title} Question"
    end
  end
end
