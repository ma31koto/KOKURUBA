class Admin::PostsController < ApplicationController
  before_action :ensure_customer, only: [:show, :edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(8)
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
  end

  def update
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
       @post.save_tag(tag_list)
       redirect_to admin_post_path(@post), notice:'スポット投稿を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    if session[:previous_url].count < 4
      redirect_to admin_customers_path
    else
      redirect_to session[:previous_url][session[:previous_url].size-3], notice:'スポット投稿を削除しました!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :postal_code, :address, :longitude, :latitude, :area_id, :spot_image, :confession_result, :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate)
  end

  def ensure_customer
    @post = Post.find(params[:id])
  end

end
