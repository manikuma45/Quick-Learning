class ProjectAdminsController < ApplicationController
  def create
    project_admin = current_admin.project_admins.create(project_id: params[:project_id])
    redirect_to projects_url, notice: "プロジェクトに参加しました"
  end

  def destroy
    project_admin = current_admin.project_admins.find_by(id: params[:id]).destroy
    redirect_to projects_url, notice: "プロジェクトを退出しました"
  end
end
