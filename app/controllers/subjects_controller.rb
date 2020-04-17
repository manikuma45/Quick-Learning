class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @subjects = @project.subjects.all
  end

  def new
    @subject = Subject.new
  end

  def show
    @parts = @subject.parts
    @part = @subject.parts.build
  end

  def edit
  end

  def create
    @project = Project.find(params[:project_id])
    @subject = @project.subjects.build(subject_params)

    if @subject.save
      redirect_to @project, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to @project, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def destroy
    @subject.destroy
    redirect_to project_subjects_path, notice: '削除しました'
  end


  private
    def set_subject
      @project = Project.find(params[:project_id])
      @subject = @project.subjects.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:project_id, :title)
    end
end
