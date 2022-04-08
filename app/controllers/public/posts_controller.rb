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
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    # @post.confession_result = avg_confession_result
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post), notice:'投稿完了しました'
    else
      render :new
    end
  end

  def edit
    @tag_list = @post.tags.pluck(:name).join(',')
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
       @post.save_tag(tag_list)
       redirect_to post_path(@post),notice:'投稿を変更しました'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to map_search_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :postal_code, :address, :longitude, :latitude, :area_id, :spot_image, :confession_result, :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate)
  end

  def ensure_correct_customer
    @post = Post.find(params[:id])
    unless @post.customer == current_customer
      redirect_to map_search_posts_path
    end
  end

  # def avg_confession_result
  #     告白成功率＝(「postの告白結果が成功の数」＋「post_commentの告白結果が成功の数」)/(「postの告白結果が成功または失敗の数」＋「post_commentの告白結果が成功または失敗の数」）*100.round(1).to_f
  #     self.where(confession_result: 0) + self.post_comments.where(confession_result: 0)/self.where(confession_result: 0).or(self.where(confession_result: 1)) + self.post_comments.where(confession_result: 0).or(self.post_comments.where(confession_result: 1))
  # end

end
