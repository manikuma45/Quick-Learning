class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.build(comment_params)
    if user_signed_in?
      @comment.user_id = current_user.id
    end
    if admin_signed_in?
      @comment.admin_id = current_admin.id
    end
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to project_subject_part_question_path(@question), notice: '投稿できませんでした...' }
      end
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:question_id, :content)
  end
end
