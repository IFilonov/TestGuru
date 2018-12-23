class TestsMailer < ApplicationMailer
  def completed_test(response)
    @user = response.user
    @test = response.test

     mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end
end
