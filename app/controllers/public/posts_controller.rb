class Public::PostsController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def map_search
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    if params[:confession_ranking] == 'asc' || params[:confession_ranking] == 'desc'
      @posts = Post.avg_confession_result_ranking(params[:confession_ranking],@posts)
    end
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
    # @post.few_people_rate = 投稿者の星＋コメントの星/（コメントの数＋１）
    # @post.standard_rate =
    # @post.all_rate =



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

end
