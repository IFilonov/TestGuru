class ApplicationController < ActionController::Base

  before_action :set_locale

  protected

  def after_sign_in_path_for(user)
    flash.notice = "Привет, #{current_user.first_name}!" if current_user.first_name
    current_user.is_a?(Admin) ? admin_tests_path : super
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang])  ? params[:lang] : I18n.default_locale
  end
end
