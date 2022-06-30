class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]
  before_action :set_session_path, only: [:map_search, :index, :new]

  def map_search
    @posts = Post.all
    @week_posts = Post.where(created_at: Time.zone.today.beginning_of_day.ago(1.month)...Time.zone.today.end_of_day)
                      .order(all_rate: "DESC")
                      .take(4)
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    # ランキング検索機能
    case judgement_params(params)
    when "new_ranking"
      @posts_pre = Post.new_ranking(params[:new_ranking], @posts)
    when "confession_ranking"
      @posts_pre = Post.avg_confession_result_ranking(params[:confession_ranking], @posts)
    when "all_rate_ranking"
      @posts_pre = Post.avg_all_rate_ranking(params[:all_rate_ranking], @posts)
    when "atmosphere_rate_ranking"
      @posts_pre = Post.avg_atmosphere_rate_ranking(params[:atmosphere_rate_ranking], @posts)
    when "few_people_rate_ranking"
      @posts_pre = Post.avg_few_people_rate_ranking(params[:few_people_rate_ranking], @posts)
    when "standard_rate_ranking"
      @posts_pre = Post.avg_standard_rate_ranking(params[:standard_rate_ranking], @posts)
    when "nothing"
      # 絞り込み検索
      @q = Post.ransack(params[:q])
      @posts = @q.result(distinct: true).page(params[:page]).per(8)
      session[:path] = request.path
      return
    end
    @posts = Kaminari.paginate_array(@posts_pre).page(params[:page]).per(8)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @tag_list = params[:post][:name].split(',')
    if @post.save
      # タグの登録
      @post.save_tag(@tag_list)
      redirect_to post_path(@post), notice: 'スポットを投稿完了しました!'
    else
      render :new
    end
  end

  def edit
    @tag_list = @post.tags.pluck(:name).join(',')
  end

  def update
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      # タグの登録
      @post.save_tag(tag_list)
      redirect_to post_path(@post), notice: 'スポット投稿を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to view_context.public_post_destroy_link, notice: 'スポット投稿を削除しました!'
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :introduction,
      :postal_code, :address, :longitude, :latitude,
      :area_id,
      :spot_image,
      :confession_result,
      :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate
      )
  end

  def ensure_correct_customer
    unless @post.customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  #スポット投稿削除後のリンク遷移先の記憶
  def set_session_path
    session[:path] = request.path
  end

  # ランキング検索の際、viewから送られてくる値
  def judgement_params(params)
    if params[:new_ranking].present?
      "new_ranking"
    elsif params[:confession_ranking].present?
      "confession_ranking"
    elsif params[:all_rate_ranking].present?
      "all_rate_ranking"
    elsif params[:atmosphere_rate_ranking].present?
      "atmosphere_rate_ranking"
    elsif params[:few_people_rate_ranking].present?
      "few_people_rate_ranking"
    elsif params[:standard_rate_ranking].present?
      "standard_rate_ranking"
    else
      "nothing"
    end
  end

end