module QuestionsHelper
  def question_header(question)
    title = question.test.title.capitalize
    if question.new_record?
      I18n.t('.create_new_question', title: title)
    else
      I18n.t('.edit_question', title: title)
    end
  end
end
