module Admin::PostsHelper
  # スポット投稿を削除した際、それぞれのリンクに遷移する
  def admin_post_destroy_link
    if session[:path].present?
      session[:path]
    else
      admin_customers_path
    end
  end
end
