module Public::PostsHelper
  # スポット投稿を削除した際、それぞれのリンクに遷移する
  def public_post_destroy_link
    if session[:path].present?
      session[:path]
    else
      customer_path(current_customer)
    end
  end
end
