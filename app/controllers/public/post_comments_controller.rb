class Public::PostCommentsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def new
    @post_comment = PostComment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_customer.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    if @post_comment.save
      redirect_to post_path(@post), notice:'コメントを投稿完了しました!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:post_id])
    if @post_comment.update(post_comment_params)
      redirect_to post_path(@post), notice:'コメント投稿を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(post), notice:'コメント投稿を削除しました!'
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:customer_id, :post_id, :title, :comment, :comment_image, :confession_result, :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate)
  end

  def ensure_correct_customer
    @post_comment = PostComment.find(params[:id])
    unless @post_comment.customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

end
