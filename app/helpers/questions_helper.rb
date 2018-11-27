module QuestionsHelper
  def question_header(create = true)
    title = @test.title.capitalize
    if create
      "Create New #{title} Question"
    else
      "Edit #{title} Question"
    end
  end
end
