class ApplicationController < ActionController::API
  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find_by_id(request.headers["UserId"]) if request.headers["UserId"]
  end

  def user_signed_in?
    return !current_user.nil?
  end

  def authenticate_user!
    redirect_to :root if !user_signed_in?
  end

end
