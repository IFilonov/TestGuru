class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    str_index = "<table>"
    @test.questions.each { |question| str_index += "<tr> #{question.body} </tr><br>" }
    str_index += "</table>"
    render html: str_index.html_safe
  end

  def show
   render html: "<i> #{@question.body}</i>".html_safe
  end

  def create
    question = @test.questions.new(body: params[:body])
    if question.save
      render html: "Question <b>#{question.body}</b> created".html_safe
    else
      render html: "Question <b>#{question.body}</b> not created".html_safe
    end
  end

  def destroy
    question = @question.destroy
    render html: "Question <b>#{question.body}</b> deleted".html_safe
  end

  private
  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render html: "<b>Question not found</b>".html_safe
  end
end
