# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview
  def completed_test
     response = Response.new(user: User.last, test: Test.last)

     TestsMailer.completed_test(response)
  end
end
