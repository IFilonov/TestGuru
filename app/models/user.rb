class User < ApplicationRecord
  has_many :responses
  has_many :tests, through: :responses
  has_many :test, foreign_key: "author_id"

  validates :email, presence: true

  def by_level(level)
    tests.by_level(level)
  end
end
