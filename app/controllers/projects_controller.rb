class ProjectsController < ApplicationController
  before_action :set_project, only: [:introduction, :edit, :update, :destroy]

  def index
    if current_user&.project_user_projects&.empty? && current_user.invited_by_id.present?
      redirect_to introduction_project_path(User.find(current_user.invited_by_id).project_user_projects.first)
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
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "投稿しました"
    else
      render 'new'
    end
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

  def introduction
    @project_user = current_user.project_users.find_by(project_id: @project.id)
  end


  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title)
    end
end
