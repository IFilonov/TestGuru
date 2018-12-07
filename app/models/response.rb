class Response < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  def completed?
    question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.question = next_question
    save!
  end

  private

  def before_validation_set_first_question
    self.question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    #correct_answers_count = correct_answers.count
    #(correct_answers_count == correct_answers.where(id: answer_ids).count) &&
  #    correct_answers_count == answer_ids.count
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', question.id).first
  end
end
