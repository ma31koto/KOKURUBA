class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(8)

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
       redirect_to admin_post_path(@post), notice:'スポット投稿を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
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

end
