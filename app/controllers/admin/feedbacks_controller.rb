class Admin::FeedbacksController < Admin::BaseController

  before_action :authenticate_user!
  before_action :set_feedback, only: %i[destroy]

  def destroy
    @feedback.destroy
    redirect_to admin_feedbacks_path
  end

  def index
    @feedbacks = Feedback.all
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end
end
