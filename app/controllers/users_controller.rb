class UsersController < ApplicationController

  before_action :find_user, only: %i[destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      render html: "User <b>#{user.login}</b> created".html_safe
    else
      render html: "User <b>#{user.login}</b> not created".html_safe
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:login, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
