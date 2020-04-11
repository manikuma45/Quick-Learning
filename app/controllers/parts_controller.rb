class PartsController < ApplicationController
  def index
    @parts=Part.all
  end

  def new
    @part=Part.new
  end

  def create
    @part=current_user.parts.build(part_params)

    if @part.save
      PartMailer.part_mail(@part).deliver
      redirect_to parts_path, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def show
    @part=Part.find(params[:id])
  end

  def edit
    @part=Part.find(params[:id])
    if @part.user_id!=current_user&.id
      redirect_to root_path
    end
  end

  def update
    @part=Part.find(params[:id])

    if @part.update(part_params)
      redirect_to parts_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def destroy
    @part=Part.find(params[:id])
    @part.destroy
    redirect_to parts_path, notice: '削除しました'
  end

  private

  def part_params
    params.require(:part).permit(:title, :content, :status)
  end
end
