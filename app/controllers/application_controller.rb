class ApplicationController < ActionController::Base
# before_action :url_history

  def after_sign_in_path_for(resource)
    customer_path(current_customer)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private
  def url_history
    if session[:previous_url].nil?
      session[:previous_url] = [request.referer]
    else
      session[:previous_url].push(request.referer)
    end  
  end
end
