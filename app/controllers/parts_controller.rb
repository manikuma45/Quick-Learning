class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  def index
    @parts=Part.all
  end

  def new
    @part=Part.new
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      redirect_to parts_path, notice: "投稿しました"
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
    @part = Part.find(params[:id])
  end  

  def part_params
    params.require(:part).permit(:title, :content, :status)
  end
end
