class ProjectUsersController < ApplicationController
  def create
    project_user = current_user.project_users.create(project_id: params[:project_id])
    redirect_to projects_url, notice: "プロジェクトに参加しました"
  end

  def destroy
    project_user = current_user.project_users.find_by(id: params[:id]).destroy
    redirect_to projects_url, notice: "プロジェクトを退出しました"
  end
end