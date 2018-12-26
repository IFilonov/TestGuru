class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(user)
    current_user.is_a?(Admin) ? admin_tests_path : super
  end
end
