class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate
    temp = session[:user]
    if temp.nil?
      redirect_to users_path(merk: request.original_url)
      flash[:error] = 'Fehler: Bitte einloggen!'
    end
  end
  
  def authenticate_admin
      unless User.find(temp).typ == 1
        flash[:error] = 'Sie haben nicht die benoetigten Rechte um diese Aktion durchzufuehren!'
        redirect_to action: :index
      end
  end
end