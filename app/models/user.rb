class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  has_many :responses
  has_many :tests, through: :responses
  has_many :grants
  has_many :badges, through: :grants
  has_many :test, foreign_key: "author_id"
  has_many :gists
  has_many :feedbacks

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def by_level(level)
    tests.by_level(level)
  end

  def current_test(test)
    responses.order(id: :desc).find_by(test_id: test.id)
  end
end
