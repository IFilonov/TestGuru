class User < ApplicationRecord
  def tests(level)
    Test.joins("join responses on responses.test_id = tests.id")
      .joins("join users on users.id = responses.user_id")
      .where("tests.level = ? and users.login = ?", level, login)
      .select(:title)
  end
end
