class Public::FavoritesController < ApplicationController
  def index
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:post_id)
    @posts = Post.find(favorites)
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
