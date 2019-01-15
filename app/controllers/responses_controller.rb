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
end
