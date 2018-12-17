class ResponsesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_response, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @response.accept!(params[:answer_ids])
    if @response.completed?
      redirect_to result_response_path(@response)
    else
      render :show
    end
  end

  private
  def set_response
     @response = Response.find(params[:id])
  end
end
