class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy, :project_launch]

  def index
    if current_admin.projects.empty? && current_admin.invited_by_id.present?
      redirect_to introduction_projects_path
    else
      @projects = Project.all
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = current_admin.projects.build(project_params)
    if @project.save
      redirect_to project_launch_project_path(@project), notice: "ローンチしました"
    else
      render 'new'
    end
  end

  def project_launch
    @project_admin = current_admin.project_admins.find_by(project_id: @project.id)
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: '削除しました'
  end

# 生徒を招待、社員が社員を招待、アプリ管理者がクライアントを招待、クライアントがプロジェクトを作成した際、それ以外の場合分け
# current_admin.invited_by_id.present?はアプリ管理者がクライアントを招待する際に設定していないとエラーになる
  def introduction
    if current_user.present?
      @project_user = Admin.find(current_user.invited_by_id).project_admin_projects.first
    elsif current_admin.present? && current_admin.invited_by_id.present? && Admin.find(current_admin.invited_by_id).project_admin_projects.present?
      @project_admin = Admin.find(current_admin.invited_by_id).project_admin_projects.first
    elsif current_admin.present? && current_admin.invited_by_id.present? && Admin.find(current_admin.invited_by_id).project_admin_projects.empty?
      redirect_to new_project_path
    else
      redirect_to new_admin_session_path
    end
  end


  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title)
    end
end
