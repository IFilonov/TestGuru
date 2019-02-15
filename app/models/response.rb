class Response < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def completed?
    question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def question_number
    test.questions.index(question) + 1
  end

  def time_remains
    time_finished? ? 0 : test.time_limit.to_i * 60 - time_passed
  end

  def time_limits?
    test.time_limit.to_i > 0
  end

  def time_finished?
    time_limits? ? time_passed > test.time_limit.to_i * 60 : false
  end

  private

  def time_passed
    Time.zone.now.to_i - created_at.to_i
  end

  def before_validation_set_first_question
    self.question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', question.id).first
  end
end
