class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :max_answers, on: :create

  def max_answers
    err_msg = "Cannot add more then 5 question"
    if (question && question.answers.count >= 5)
      errors.add(:question_id) << err_msg
    end
  end
end
