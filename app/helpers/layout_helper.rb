module LayoutHelper
  def usertest
    
    if session[:user].nil?
      link_to 'Log in!', users_path
    else
      link_to 'Logout', logout_path
    end  
  end
  def username
    if session[:user].present?
      user=User.find(session[:user])
      if user.present?
        "<p>Angemeldet als #{user.benutzername}</p>".html_safe
      end  
    end
  end

  def userpage
    if session[:user].present?
      link_to 'Userpage', userpage_path
    end
  end 
  
end
