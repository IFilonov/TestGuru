module ResponsesHelper

  SUCCESS_RESULT = 85

  def test_result
    @response.correct_questions * 100 / @response.test.questions.count
  end

  def result_success?
    test_result > SUCCESS_RESULT
  end

  def progress_result
    if @response.test.questions.count > 0
      (@response.question_number - 1) * 100 / @response.test.questions.count
    end
  end
end
