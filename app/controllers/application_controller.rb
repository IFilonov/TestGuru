class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def logged_in?
    current_user.present?
  end

  private

  def authenticate_user!
    unless current_user
      cookies[:start_page] = request.url
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
