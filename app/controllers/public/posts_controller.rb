class Public::PostsController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def map_search
  end

  def index
    @posts = Post.page(params[:page]).per(10)
    @tag_list=Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment=PostComment.new
    @post_tags = @post.tags
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    tag_list = params[:post][:tag_name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post), notice:'投稿完了しました'
    else
      render :new
    end
  end

  def edit
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(',')
    if @post.update(post_params)
       @post.save_tag(tag_list)
       redirect_to post_path(@post),notice:'投稿を変更しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to map_search_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :postal_code, :address, :area_id, :spot_image, :confession_result)
  end

  def ensure_correct_customer
    @post = Post.find(params[:id])
    unless @post.customer == current_user
      redirect_to map_search_posts_path
    end
  end
end
