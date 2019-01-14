class ResponsesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_response, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @response.accept!(params[:answer_ids])
    if @response.completed?
      TestsMailer.completed_test(@response).deliver_now
      redirect_to result_response_path(@response)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@response.question).call
    flash_options = if result.success?
      { notice: t('.success') }
    else
      { alert: t('.failed') }
    end

    redirect_to @response, flash_options
  end

  private
  def set_response
     @response = Response.find(params[:id])
  end
end
