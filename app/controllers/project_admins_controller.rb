class ProjectAdminsController < ApplicationController
  # プロジェクトの作成者と招待された人とで書き方を分岐（redirect先は一緒）
  def create
    project_admin = current_admin.project_admins.create(project_id: params[:project_id])
    if current_admin.projects.last.present?
      redirect_to current_admin.projects.last, notice: "プロジェクトに参加しました！"
    else
      redirect_to current_admin.project_admin_projects.last, notice: "プロジェクトに参加しました。"
    end
  end

  def destroy
    project_admin = current_admin.project_admins.find_by(project_id: params[:id]).destroy
    redirect_to projects_url, notice: "プロジェクトを退出しました。"
  end
end
