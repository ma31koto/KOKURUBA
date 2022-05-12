class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: 'タグ名を作成しました!'
    else
      flash[:danger] = @tag.errors.full_messages
      redirect_to admin_tags_path
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: 'タグ名を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path, notice: 'タグ名を削除しました!'
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

end
