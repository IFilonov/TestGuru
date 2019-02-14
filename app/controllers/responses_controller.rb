class ResponsesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_response, only: %i[show update result gist]

  def show
    if $time_limit_sec.nil?
      $time_limit_sec = Time.now.to_i + @response.test.response_time.to_i * 60
    end
  end

  def result
    reset_time
  end

  def update
    answers = params[:answer_ids]
    if (answers)
      @response.accept!(answers)
      if @response.completed?
        TestsMailer.completed_test(@response).deliver_now
        flash.notice = "Поздравляю! У Вас новое достижение!" if BudgeRule.check_badges(@response) > 0
        redirect_to result_response_path(@response) and return
      else
        if time_finished?
          flash.alert = "Закончилось время прохождения теста"
          redirect_to result_response_path(@response)
        else
          render :show
        end
      end
    else
      flash_options = { alert: t('.choice') }
      redirect_to @response, flash_options and return
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

  private
  def set_response
     @response = Response.find(params[:id])
  end

  def reset_time
    $time_limit_sec = nil
  end

  def time_finished?
    Time.now.to_i - $time_limit_sec.to_i > 0
  end
end
