module ResponsesHelper

  SUCCESS_RESULT = 85

  def test_result
    @response.correct_questions * 100 / @response.test.questions.count
  end

  def result_success?
    test_result > SUCCESS_RESULT
  end
end
