class SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to subjects_path, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path, notice: '削除しました'
  end


  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:title)
    end
end
