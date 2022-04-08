class Public::PostCommentsController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def new
    @post_comment = PostComment.new
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)

  end

  def edit
  end

  def update
    post = Post.find(params[:post_id])
    if @post_comment.update(post_comment_params)
       redirect_to post_path(post),notice:'投稿を変更しました'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
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
