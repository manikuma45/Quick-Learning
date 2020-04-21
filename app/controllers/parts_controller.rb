class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  def index
    @parts = Part.all
  end

  def new
    @project = Project.find(params[:project_id])
    @subject = Subject.find(params[:subject_id])
    @part=Part.new
  end

# なぜここだけredirect_toの書き方を変えないと読み込まないのか？
  def create
    @project = Project.find(params[:project_id])
    @subject = @project.subjects.find(params[:subject_id])
    @part = @subject.parts.build(part_params)

    if @part.save
      redirect_to project_subject_path(id: @subject.id), notice: "投稿しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @part.update(part_params)
      redirect_to parts_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def destroy
    @part.destroy
    redirect_to parts_path, notice: '削除しました'
  end

  private

  def set_part
    @project = Project.find(params[:project_id])
    @subject = Subject.find(params[:subject_id])
    @part = @subject.parts.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:title, :content, :status, :subject_id, :project_id)
  end
end
