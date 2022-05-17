class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_post, only: [:create, :destroy]

  def index
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:post_id)
    @q = Post.where(id: favorites).ransack(params[:q])
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
      @q = Post.where(id: favorites).ransack(params[:q])
      @posts = @q.result(distinct: true).page(params[:page]).per(8)
      session[:path] = request.path
      return
    end
    @posts = Kaminari.paginate_array(@posts_pre).page(params[:page]).per(8)
    session[:path] = request.path
  end

  def create
    favorite = current_customer.favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    favorite = current_customer.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
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
