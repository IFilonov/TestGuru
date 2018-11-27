class TestsController < ApplicationController

  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render html: "<b>Couldn't find test with id = #{params[:id]}</b>".html_safe
  end
end
