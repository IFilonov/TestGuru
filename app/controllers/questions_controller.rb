class QuestionsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    str_index = "<table>"
    @test.questions.each { |question| str_index += "<tr> #{question.body} </tr><br>" }
    str_index += "</table>"
    render html: str_index.html_safe
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
       redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
       redirect_to test_path(@test)
    else
       render :new
    end
  end

  def destroy
    test = @question.test
    question = @question.destroy
    redirect_to test_path(test)
  end

  def new
    @question = @test.questions.new
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

  def question_params
    params.require(:question).permit(:body)
  end
end
