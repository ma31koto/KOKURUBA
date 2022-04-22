class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def map_search
    @posts = Post.all
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)

　　# ランキング検索機能
    if params[:confession_ranking] == 'asc' || params[:confession_ranking] == 'desc'
      @posts_pre = Post.avg_confession_result_ranking(params[:confession_ranking],@posts)
      @posts = Kaminari.paginate_array(@posts_pre).page(params[:page]).per(8)
    elsif params[:all_rate_ranking] == 'asc' || params[:all_rate_ranking] == 'desc'
      @posts_pre = Post.avg_all_rate_ranking(params[:all_rate_ranking],@posts)
      @posts = Kaminari.paginate_array(@posts_pre).page(params[:page]).per(8)
    elsif params[:atmosphere_rate_ranking] == 'asc' || params[:atmosphere_rate_ranking] == 'desc'
      @posts_pre = Post.avg_atmosphere_rate_ranking(params[:atmosphere_rate_ranking],@posts)
      @posts = Kaminari.paginate_array(@posts_pre).page(params[:page]).per(8)
    elsif params[:few_people_rate_ranking] == 'asc' || params[:few_people_rate_ranking] == 'desc'
      @posts_pre = Post.avg_few_people_rate_ranking(params[:few_people_rate_ranking],@posts)
      @posts = Kaminari.paginate_array(@posts_pre).page(params[:page]).per(8)
    elsif params[:standard_rate_ranking] == 'asc' || params[:standard_rate_ranking] == 'desc'
      @posts_pre = Post.avg_standard_rate_ranking(params[:standard_rate_ranking],@posts)
      @posts = Kaminari.paginate_array(@posts_pre).page(params[:page]).per(8)
    else
      @q = Post.ransack(params[:q])
      @posts = @q.result(distinct: true).page(params[:page]).per(8)
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @posts = Post.all
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    tag_list = params[:post][:name].split(',')
    if @post.save
      # タグの登録
      @post.save_tag(tag_list)
      redirect_to post_path(@post), notice:'スポットを投稿完了しました!'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      # タグの登録
       @post.save_tag(tag_list)
       redirect_to post_path(@post), notice:'スポット投稿を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    if session[:previous_url].count < 4
      redirect_to homes_about_path
    else
      redirect_to session[:previous_url][session[:previous_url].size-3], notice:'スポット投稿を削除しました!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :postal_code, :address, :longitude, :latitude, :area_id, :spot_image, :confession_result, :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate)
  end

  def ensure_correct_customer
    @post = Post.find(params[:id])
    unless @post.customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

end
