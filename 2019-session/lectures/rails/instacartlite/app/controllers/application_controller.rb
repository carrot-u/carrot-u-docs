class ApplicationController < ActionController::Base
  private

  def require_user
    redirect_to :login_url unless current_user
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
