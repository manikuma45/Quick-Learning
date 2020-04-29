class UsersController < ApplicationController
  skip_before_action :admin_login_required

  def show
    @user = User.find(params[:id])
  end
end
