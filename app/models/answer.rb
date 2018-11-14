class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects, -> { where(correct: true) }

  validates :body, presence: true
  validate :max_answers, on: :create

  def max_answers
    err_msg = "Cannot add more then 4 question"
    errors.add(:question_id) << err_msg if question.answers.count >= 4
  end
end
