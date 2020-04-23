class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def questions
    @questions = Qusetion.where(user_id: current_user.id)
  end
end
