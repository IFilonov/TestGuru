class ResponsesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_response, only: %i[show update result gist]
  before_action :time_finished?, only: :update

  def show
  end

  def result
  end

  def update
    answers = params[:answer_ids]
    if (answers)
      @response.accept!(answers)
      if @response.completed?
        TestsMailer.completed_test(@response).deliver_now
        flash.notice = "Поздравляю! У Вас новое достижение!" if BudgeRule.check_badges(@response) > 0
        redirect_to result_response_path(@response)
      else
        render :show
      end
    else
      flash_options = { alert: t('.choice') }
      redirect_to @response, flash_options
    end
  end

  def gist
    service = GistQuestionService.new(@response.question)
    url = service.call
    if service.success?
      flash_options = { notice: t('.success') + ": #{url}" }
      gist = Gist.new(url: url)
      gist.user = current_user;
      gist.question = @response.question
      gist.save
    else
      flash_options = { alert: t('.failed') }
    end

    redirect_to @response, flash_options
  end

  def time_finished?
    if @response.time_finished?
      flash.alert = "Закончилось время прохождения теста"
      redirect_to result_response_path(@response)
    end
  end

  private
  def set_response
     @response = Response.find(params[:id])
  end
end
