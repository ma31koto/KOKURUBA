class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = PostComment.ransack(params[:q])
    @post_comments = @q.result(distinct: true).page(params[:page]).per(8)
    session[:path] = request.path
  end

  def edit
    @post_comment = PostComment.find(params[:id])
    session[:previous_url] = request.referer
  end

  def update
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
    if @post_comment.update(post_comment_params)
      redirect_to session[:previous_url], notice: 'コメント投稿を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to session[:previous_url], notice: 'コメント投稿を削除しました!'
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:customer_id, :post_id, :title, :comment, :comment_image, :confession_result, :atmosphere_rate, :few_people_rate, :standard_rate, :all_rate)
  end
end
