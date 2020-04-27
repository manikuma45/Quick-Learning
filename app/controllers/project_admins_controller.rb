class ProjectAdminsController < ApplicationController
  skip_before_action :admin_login_required
  # プロジェクト参加済、招待者、管理者で処理の分岐
  def create
    if admin_participation?
      project_admin = current_admin.project_admins.last.destroy
      project_admin = current_admin.project_admins.create(project_id: params[:project_id])
        redirect_to admin_project, notice: "プロジェクトを変更しました！"
    elsif current_admin.invited_by_id.present?
      project_admin = current_admin.project_admins.create(project_id: params[:project_id])
      redirect_to Admin.find(current_admin.invited_by_id).project_admin_projects.last, notice: "プロジェクトに参加しました！"
    else
      project_admin = current_admin.project_admins.create(project_id: params[:project_id])
      redirect_to current_admin.projects.last, notice: "プロジェクトに参加しました！"
    end
  end

  def destroy
    project_admin = current_admin.project_admins.find_by(admin_id: params[:id]).destroy
    if current_admin.projects.present?
      redirect_to projects_url, notice: "プロジェクトを退出しました。"
    else
      render :new
    end
  end
end
