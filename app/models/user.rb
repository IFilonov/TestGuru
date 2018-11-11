class User < ApplicationRecord
  has_many :tests, through: :responses
  has_many :responses
  def tests_by_level(level)
    Test.joins("join responses on responses.test_id = tests.id")
      .where(level: level, responses: { user_id: id }).pluck(:title)
  end
end
