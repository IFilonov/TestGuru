class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(user)
    flash.notice = "Привет, #{current_user.first_name}!" if current_user.first_name 
    current_user.is_a?(Admin) ? admin_tests_path : super
  end
end
