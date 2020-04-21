class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @questions = @project.questions.all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = @project.questions.build(question_params)

    if @question.save
      redirect_to project_questions_path, notice: "投稿しました"
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
      redirect_to project_questions_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to project_questions_path, notice: '削除しました'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :project_id)
  end
end
