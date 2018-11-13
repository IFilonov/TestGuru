class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects, -> { where(correct: 'Y') }

  validates :body, presence: true
  validate :max_answers, on: :create

  def max_answers
    errors.add(:question_id) << "Cannot add more then 4 question" if Answer.
      where(question: question).count() >= 4
  end
end
