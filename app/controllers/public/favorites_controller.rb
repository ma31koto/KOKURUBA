class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def index
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:post_id)
    @q = Post.where(id: favorites).ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(8)

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
      @q = Post.where(id: favorites).ransack(params[:q])
      @posts = @q.result(distinct: true).page(params[:page]).per(8)
    end
  end

  def create
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

end
