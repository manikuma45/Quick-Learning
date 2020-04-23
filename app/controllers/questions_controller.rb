class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_part, only: [:create, :new, :index, :show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = @part.questions.build(question_params)
    @question.user_id = current_user.id
    @question.project_id = user_project.id
    @question.subject_id = @part.subject_id
    if @question.save
      redirect_to project_subject_part_path(@project, @subject, @part), notice: "投稿しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to project_subject_part_questions_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to project_subject_part_questions_path, notice: '削除しました'
  end

  def user_question
    @questions = Question.joins({:part => {:subject => :project}})
  end

  private

  def set_part
    @project = Project.find(params[:project_id])
    @subject = Subject.find(params[:subject_id])
    @part = Part.find(params[:part_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :project_id, :subject_id, :part_id, :user_id)
  end
end
