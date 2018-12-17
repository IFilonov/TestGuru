class User < ApplicationRecord
  has_many :responses
  has_many :tests, through: :responses
  has_many :test, foreign_key: "author_id"

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def by_level(level)
    tests.by_level(level)
  end

  def current_test(test)
    responses.order(id: :desc).find_by(test_id: test.id)
  end
end
