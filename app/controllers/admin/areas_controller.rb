class Admin::AreasController < ApplicationController
  def index
    @areas = Area.all
    @area = Area.new
  end

  def create
    area = Area.new(area_params)
    if area.save
      redirect_to admin_areas_path, notice:'エリア名を作成しました!'
    else
      redirect_to admin_areas_path
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      redirect_to admin_areas_path, notice:'エリア名を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    area = Area.find(params[:id])
    area.destroy
    redirect_to admin_areas_path, notice:'エリア名を削除しました!'
  end

  private

  def area_params
    params.require(:area).permit(:name)
  end

end
