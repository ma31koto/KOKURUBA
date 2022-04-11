class Public::PostCommentsController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def new
    @post_comment = PostComment.new
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find(params[:post_id])
    post_comment = current_customer.post_comments.new(post_comment_params)
    post_comment.post_id = post.id
    sum_atmosphere_rate = post.atmosphere_rate*(1 + post.post_comments.count)
    if post_comment.save
      update_atmosphere_rate = (sum_atmosphere_rate + post_comment.atmosphere_rate).to_f/(1 + post.post_comments.count).to_f
      post.update_attribute(:atmosphere_rate, update_atmosphere_rate)
    end
    redirect_to post_path(post)
  end

  def edit
  end

  def update
    post = Post.find(params[:post_id])
    set_sum_atmosphere_rate = post.atmosphere_rate*(1 + post.post_comments.count) - @post_comment.atmosphere_rate
    if @post_comment.update(post_comment_params)
      update_atmosphere_rate = (set_sum_atmosphere_rate + @post_comment.atmosphere_rate).to_f/(1 + post.post_comments.count).to_f
      post.update_attribute(:atmosphere_rate, update_atmosphere_rate)
      redirect_to post_path(post),notice:'投稿を変更しました'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    sum_atmosphere_rate = post.atmosphere_rate*(1 + post.post_comments.count)
    if PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
      update_atmosphere_rate = (sum_atmosphere_rate - @post_comment.atmosphere_rate).to_f/(1 + post.post_comments.count).to_f
      post.update_attribute(:atmosphere_rate, update_atmosphere_rate)
    end

    redirect_to post_path(post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:customer_id, :post_id, :title, :comment, :comment_image, :confession_result, :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate)
  end

  def ensure_correct_customer
    @post_comment = PostComment.find(params[:id])
    unless @post_comment.customer == current_customer
      redirect_to map_search_posts_path
    end
  end
end
