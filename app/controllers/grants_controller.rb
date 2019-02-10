class GrantsController < ApplicationController

  before_action :authenticate_user!

  def index
    @grants = current_user.grants;
  end
end
