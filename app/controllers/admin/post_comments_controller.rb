class Admin::PostCommentsController < ApplicationController
  before_action :ensure_customer, only: [:edit, :update, :destroy]

  def index
    @q = PostComment.ransack(params[:q])
    @post_comments = @q.result(distinct: true).page(params[:page]).per(8)
  end

  def edit
  end

  def update
    @post = Post.find(params[:post_id])
    if @post_comment.update(post_comment_params)
       redirect_to admin_post_path(@post), notice:'コメント投稿を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to admin_post_path(post), notice:'コメント投稿を削除しました!'
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:customer_id, :post_id, :title, :comment, :comment_image, :confession_result, :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate)
  end

  def ensure_customer
    @post_comment = PostComment.find(params[:id])
  end
end
