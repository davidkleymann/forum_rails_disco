module LayoutHelper
  def usertest
    if session[:user].nil?
      if params[:merk].nil? && params[:merk] != users_path
        merke = request.original_url
      else
        merke = params[:merk]
      end
      link_to 'Log in!', users_path(merk: merke)
    else
      (link_to 'Logout', logout_users_path, method: :post)
      
    end
  end
  def username
    if session[:user].present?
      user=User.find(session[:user])
      if user.present?
       
        content_tag(:p, "Angemeldet als #{user.benutzername}")
        
      end  
    end
  end

  def userpage
    if session[:user].present?
      link_to 'Userpage', userpage_users_path
    end
  end 

  def gravatar
    if session[:user].present?
      require 'digest/md5'
      email_address = User.find(session[:user]).email.downcase
      hash = Digest::MD5.hexdigest(email_address)
      image_src = "http://www.gravatar.com/avatar/#{hash}"
      image_tag(image_src)
    end
  end
end
