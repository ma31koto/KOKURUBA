class Admin::PostsController < ApplicationController
  before_action :ensure_customer, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
       @post.save_tag(tag_list)
       redirect_to admin_post_path(@post), notice:'投稿を変更しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_post_path(@post), notice:'投稿を削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :postal_code, :address, :longitude, :latitude, :area_id, :spot_image, :confession_result, :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate)
  end

  def ensure_customer
    @post = Post.find(params[:id])
  end

end
