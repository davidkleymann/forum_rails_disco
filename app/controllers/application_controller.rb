class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def current_user
    @current_user ||= session[:user] && User.find(session[:user]) || User.guest rescue User.guest
	end
  helper_method :current_user
  
  def authenticate
    unless current_user.authenticated?
      redirect_to users_path(merk: request.original_url), alert: 'Fehler: Bitte einloggen!'
    end
	end
  
  def require_admin
    unless current_user.admin?
      redirect_to action: :index, alert: 'Sie haben nicht die benoetigten Rechte um diese Aktion durchzufuehren!'
    end
  end
end
