class FeedbacksMailer < ApplicationMailer
  def completed_feedback(feedback)
    @admin = Admin.first
    @body = feedback.body

     mail to: @admin.email, subject: 'Feedback was completed on TestsGuru!'
  end
end
