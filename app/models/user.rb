class User < ApplicationRecord
  def tests(level)
    Test.joins("join questions on tests.id = questions.test_id")
      .joins("join responses on responses.question_id = questions.id")
      .joins("join users on users.id = responses.user_id")
      .where("tests.level = ? and users.login = ?", level, login)
      .select(:title).distinct
  end
end
