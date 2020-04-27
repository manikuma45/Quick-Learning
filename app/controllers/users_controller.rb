class UsersController < ApplicationController
  skip_before_action :admin_login_required

  def show
    @user = User.find(params[:id])
  end

  def questions
    @questions = Qusetion.where(user_id: current_user.id)
  end
end
