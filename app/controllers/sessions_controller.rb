class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash[:alert] = "Are you sure? Verify your Email and Passwors please"
      render :new
    end
  end
end
