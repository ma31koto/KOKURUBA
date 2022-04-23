class ApplicationController < ActionController::Base
  before_action :url_history

  def after_sign_in_path_for(resource)
    customer_path(current_customer)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  # スポット投稿・コメント投稿削除の際、4つ前のリンクに遷移させる為、urlを記録
  def url_history
    if session[:previous_url].nil?
      session[:previous_url] = [request.referer]
    else
      if session[:previous_url].count >= 4
        session[:previous_url].shift
      end
      session[:previous_url].push(request.referer)
    end
  end
end
