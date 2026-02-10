class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

private

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "You must be signed in to access this page."
    end
  end

  def require_admin
    unless current_user.admin?
      redirect_to movies_url, alert: "You must be an admin to access this page."
    end
  end
end
